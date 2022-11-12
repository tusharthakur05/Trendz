"use strict";
function demoSection(index) {
    let img = document.getElementsByClassName('demo-section-item');
    let dot = document.getElementsByClassName('nav-dot-item');
    if(img != null && dot != null) {
        let itr = 0;
        let idx = 0;
        
        while(itr < img.length) {
            if(img[itr].style.display == "block") {
                img[itr].style.display = "none"; 
                dot[itr].style.color = "azure"; 
                idx = itr; 
            }
            itr++;
        }
        if(index >= 0) {
            img[index].style.display = "block";
            dot[index].style.color = "green";
        }
        else if(index == -1){
            idx = (idx + 1) % img.length;
            img[idx].style.display = "block";
            dot[idx].style.color = "green";
        }
        else {
            idx = (idx == 0) ? img.length : idx - 1;
            img[idx].style.display = "block";
            dot[idx].style.color = "green";
        }
    }
}

function signupDisplay() {
    let sUp = document.getElementsByClassName("signup");
    let sIn = document.getElementsByClassName("signin");
    let fp = document.getElementsByClassName("forgotpassword");
    if(!sIn || !sUp || !fp) {
        console.log("clear you browser cache and refresh the page...")
        return;
    }
    sIn[0].style.display="none";
    sUp[0].style.display="block";
    fp[0].style.display="none";
}

function signinDisplay() {
    let sUp = document.getElementsByClassName("signup");
    let sIn = document.getElementsByClassName("signin");
    let fp = document.getElementsByClassName("forgotpassword");
    if(!sIn || !sUp || !fp) {
        console.log("clear you browser cache and refresh the page...")
        return;
    }
    sIn[0].style.display="block";
    sUp[0].style.display="none";
    fp[0].style.display="none";
}

function forgotpasswordDisplay() {
	let sUp = document.getElementsByClassName("signup");
    let sIn = document.getElementsByClassName("signin");
    let fp = document.getElementsByClassName("forgotpassword");
    if(!sIn || !sUp || !fp) {
        console.log("clear you browser cache and refresh the page...")
        return;
    }
    sIn[0].style.display="none";
    sUp[0].style.display="none";
    fp[0].style.display="block";
}

function homePage() {
    window.location.href="../index.jsp";
}

function validateEmail(mailId, wrn_msg) {
    let email_field = document.getElementsByName(mailId)[0];
    let email_reg = (/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
    if(email_reg.test(email_field.value)) {
        email_field.style.borderColor = "green";
        document.getElementById(wrn_msg).style.display = "none";
    }
    else {
        email_field.style.borderColor = "red";
        document.getElementById(wrn_msg).style.display = "inline";
    }
}

function togglePassword(pwd_icon_id, pwd_id) {
    let p_icon = document.getElementById(pwd_icon_id);
    let p_text = document.getElementById(pwd_id);
    if(p_icon && p_text) {
        if(p_icon.getAttribute('class') == 'bi bi-eye-fill') {
            p_icon.setAttribute('class', 'bi bi-eye-slash-fill');
            p_text.setAttribute('type', 'password');
        }
        else {
            p_icon.setAttribute('class', 'bi bi-eye-fill');
            p_text.setAttribute('type', 'text');
        }
    }
}


const citiesByState = {
	      "Odisha": ["Bhubaneswar", "Puri", "Cuttack"],
	      "Maharashtra": ["Mumbai", "Pune", "Nagpur"],
	      "Madhya Pradesh": ["Agar", "Malwa", "Alirajpur", "Anuppur", "Ashoknagar", "Balaghat", "Barwani", "Betul", "Bhind", "Bhopal", "Burhanpur", "Chhatarpur", "Chhindwara", "Damoh", "Datia", "Dewas", "Dhar", "Dindori", "Guna", "Gwalior", "Harda", "Hoshangabad", "Indore", "Jabalpur", "Jhabua", "Katni", "Khandwa", "Khargone", "Mandla", "Mandsaur", "Morena", "Narsinghpur", "Neemuch", "Panna", "Raisen", "Rajgarh", "Ratlam", "Rewa", "Sagar", "Satna", "Sehore", "Seoni", "Shahdol", "Shajapur", "Sheopur", "Shivpuri", "Sidhi", "Singrauli", "Tikamgarh", "Ujjain", "Umaria", "Vidisha"],
	      "Andhra Pradesh": ["Anantapur", "Chittoor", "East Godavari", "Guntur", "Krishna", "Kurnool", "Prakasam", "Srikakulam", "Sri Potti Sriramulu Nellore", "Visakhapatnam", "Vizianagaram", "West Godavari", "YSR District", "Kadapa (Cuddapah)"],
	      "Andaman and Nicobar Islands": ["Nicobar", "North and Middle Andaman", "South Andaman"],
	      "Arunachal Pradesh": ["Anjaw", "Changlang", "Dibang Valley", "East Kameng", "East Siang", "Kamle", "Kra Daadi", "Kurung Kumey", "Lepa Rada", "Lohit", "Longding", "Lower Dibang Valley", "Lower Siang", "Lower Subansiri", "Namsai", "Pakke Kessang", "Papum Pare", "Shi Yomi", "Siang", "Tawang", "Tirap", "Upper Siang", "Upper Subansiri", "West Kameng", "West Siang"],
	      "Assam": ["Baksa", "Barpeta", "Biswanath", "Bongaigaon", "Cachar", "Charaideo", "Chirang", "Darrang", "Dhemaji", "Dhubri", "Dibrugarh", "Dima Hasao (North Cachar Hills)", "Goalpara", "Golaghat", "Hailakandi", "Hojai", "Jorhat", "Kamrup", "Kamrup Metropolitan", "Karbi Anglong", "Karimganj", "Kokrajhar", "Lakhimpur", "Majuli", "Morigaon", "Nagaon", "Nalbari", "Sivasagar", "Sonitpur", "South Salamara-Mankachar", "Tinsukia", "Udalguri", "West Karbi Anglong"],
	      "Bihar": ["Araria", "Arwal", "Aurangabad", "Banka", "Begusarai", "Bhagalpur", "Bhojpur", "Buxar", "Darbhanga", "East Champaran (Motihari)", "Gaya", "Gopalganj", "Jamui", "Jehanabad", "Kaimur (Bhabua)", "Katihar", "Khagaria", "Kishanganj", "Lakhisarai", "Madhepura", "Madhubani", "Munger (Monghyr)", "Muzaffarpur", "Nalanda", "Nawada", "Patna", "Purnia (Purnea)", "Rohtas", "Saharsa", "Samastipur", "Saran", "Sheikhpura", "Sheohar", "Sitamarhi", "Siwan", "Supaul", "Vaishali", "West Champaran"],
	      "Chandigarh": ["Chandigarh"],
	      "Chhattisgarh": ["Balod", "Baloda Bazar", "Balrampur", "Bastar", "Bemetara", "Bijapur", "Bilaspur", "Dantewada (South Bastar)", "Dhamtari", "Durg", "Gariyaband", "Janjgir-Champa", "Jashpur", "Kabirdham (Kawardha)", "Kanker (North Bastar)", "Kondagaon", "Korba", "Korea (Koriya)", "Mahasamund", "Mungeli", "Narayanpur", "Raigarh", "Raipur", "Rajnandgaon", "Sukma", "Surajpur", "Surguja"],
	      "Dadar and Nagar Haveli": ["Dadra & Nagar Haveli"],
	      "Daman and Diu": ["Daman", "Diu"],
	      "Delhi": ["Central Delhi", "East Delhi", "New Delhi", "North Delhi", "North East Delhi", "North West Delhi", "Shahdara", "South Delhi", "South East Delhi", "South West Delhi", "West Delh"],
	      "Lakshadweep": ["Agatti", "Amini", "Andrott", "Bitra", "Chetlat", "Kadmat", "Kalpeni", "Kavaratti", "Kiltan", "Minicoy"],
	      "Puducherry": ["Ariankuppam", "Karaikal", "Mahe", "Manavely", "Ozhukarai", "Puducherry", "Thirumalairayanpattinam", "Villianur", "Yanam"],
	      "Goa": ["Bicholim", "Canacona", "Cuncolim", "Mapusa", "Margo", "Mormugao", "Panaji", "Pernem", "Ponda", "Quepem", "Sanguem", "Sanquelim", "Valpoi"],
	      "Gujarat": ["Ahmedabad", "Surat", "Vadodara", "Rajkot", "Bhavnagar", "Jamnagar", "Junagadh", "Gandhinagar", "Gandhidham", "Anand", "Navsari", "Morbi", "Nadiad", "Surendranagar", "Bharuch", "Mehsana", "Bhuj", "Porbandar", "Palanpur", "Valsad", "Vapi", "Gondal", "Veraval", "Godhara", "Patan", "Kalol", "Gandhinagar", "Dahod", "Botad", "Amreli", "Deesa", "Jetpur"],
	      "Haryana": ["Faridabad", "Gurugram", "Panipat", "Ambala", "Yamunanagar", "Rohtak", "Hisar", "Karnal", "Sonipat", "Panchkula", "Bhiwani", "Sirsa", "Bahadurgarh", "Jind", "Thanesar", "Kaithal", "Rewari", "Mahendergarh", "Pundri", "Kosli"],
	      "Himachal Pradesh": ["Kangra", "Simla", "Mandi"],
	      "Jammu and Kashmir": ["Anantnag", "Bandipora", "Baramulla", "Budgam", "Doda", "Ganderbal", "Jammu", "Kathua", "Kishtwar", "Kulgam", "Kupwara", "Poonch", "Pulwama", "Reasi", "Rajouri", "Ramban", "Samba", "Shopian", "Srinagar", "Udhampur"],
	      "Jharkhand": ["Jamshedpur", "Dhanbad", "Ranchi", "Bokaro Steel City", "Deoghar", "Phusro", "Hazaribagh", "Giridih", "Ramgarh", "Medininagar", "Chirkunda"],
	      "Karnataka": ["Bangalore", "Hubli-Dharwad", "Mysore", "Gulbarga", "Mangalore", "Belgaum", "Devanagere", "Bellary", "Bijapur", "Shimoga", "Tumkur", "Raichur", "Bidar", "Hospet", "Gadag-Betageri", "Robertsonpet", "Hassan", "Bhadravati", "Chitradurga", "Udupi", "Kolar", "Mandya", "Chikmagalur", "Gangavati", "Bagalkot", "Ranebennuru"],
	      "Kerala": ["Thiruvananthapuram", "Kozhikode", "Kochi", "Kollam", "Thrissur", "Kannur", "Alappuzha", "Kottayam", "Palakkad", "Manjeri", "Thalassery", "Thrippunithura", "Ponnani", "Vatakara", "Kanhangad", "Payyanur", "Koyilandy", "Kodungallur", "Parappanangadi", "Kalamassery", "Neyyattinkara", "Guruvayur", "Tanur", "Kayamkulam", "Malappuram", "Thrikkakkara", "Wadakkancherry", "Irinjalakuda", "Nedumangad", "Kondotty", "Panoor", "Tirirangadi", "Tirur", "Changanassery", "Feroke", "Kunnamkulam", "Kasaragod", "Ottappalam", "Tiruvalla", "Thodupuzha", "Ettumanoor", "Perinthalmanna", "Chalakudy", "Payyoli", "Koduvally", "Kottakkal", "Mananthavady", "Karunagappalli", "Mattanur", "Punalur", "Nilambur", "Cherthala", "Pandalam", "Sultan Bathery", "Madaru", "Valanchery", "Taliparamba", "Shornur", "Kattappana", "Mukkam", "Iritty", "Varkala", "Cherpulassery", "Nileshwaram", "Chavakkad", "Kothamangalam", "Pathanamthitta", "Attingal", "Paravur", "Ramanattukara", "Erattupetta", "Sreekandapuram", "Angamaly", "Chittur-Thanthamangalam", "Kuthuparamba", "Mannarkkad", "Kalpetta", "North Paravur", "Haripad", "Muvattupuzha", "Kottarakara", "Adoor", "Piravom", "Pattambi", "Anthoor", "Perumbavoor", "Mavelikkara", "Eloor", "Chengannur", "Vaikom", "Aluva", "Pala", "Koothattukulam"],
	      "Manipur": ["Imphal", "Kakching", "Lamshang", "Andro", "Ukhrul", "Lamlai", "Lilong", "Moirang", "Wangoi", "Churachan", "Moreh", "Jiribam", "Bishnupur", "Mayang", "Nambol", "Tamenglong", "Lilong", "Samurou", "Wangjing", "Thoubal", "Thongkhong", "Yairipok", "Ningthoukh", "Heirok", "Kangpokpi", "Kwakta", "Sekmai Bazar", "Lamjaotong", "Kumbi", "kakching", "Sugnu", "Oinam", "sikhong", "Porompat", "Tengnoupal", "Nungba", "Jessami", "Noney", "Purul Atongba", "Lamphelpat", "Chandel", "Saikul", "Patsoi", "Tadubi", "Khongman", "Naoriya Pakhanglak", "Chingai", "Phungyar", "Kasom Khullen", "Chakpikarong", "Tipaimukh"],
	      "Meghalaya": ["West Jaintia hills", "East Jaintia hills", "East Khasi hills", "West Khasi hills", "South West Khasi hills", "Ri-Bhoi", "North Garo hills", "East Garo hills", "South Garo hills", "West Garo hills", "South West Garo hills"],
	      "Mizoram": ["Aizawl", "Lunglei ", "Champhai", "Siaha ", "Kolasib ", "Serchhip  ", "Lawngtlai ", "Mamit ", "Saitual ", "Hnahthial", "Khawzawl "],
	      "Nagaland": ["Dimapur", "Kiphire", "Kohima", "Longleng", "Mokokchung", "Mon", "Peren", "Phek", "Tuensang", "Wokha", "Zunheboto", "Noklak"],
	      "Punjab": ["Amritsar", "Barnala", "Bathinda", "Faridkot", "Fatehgarh  Sahib", "Fazilka", "Ferozepur", "Gurdaspur", "Hoshiarpur", "Jalandhar", "Kapurthala", "Ludhiana", "Mansa", "Moga", "Muktsar", "Nawanshahr(Shahid Bhagat Singh Nagar)", "Pathankot ", "Patiala", "Rupnagar", "Sahibzada", "Ajit  Singh Nagar (Mohali)", "Sangrur", "Tarn Taran"],
	      "Rajasthan": ["Ajmer", "Alwar", "Banswara", "Baran", "Barmer", "Bharatpur", "Bhilwara", "Bikaner", "Bundi", "Chittorgarh", "Churu", "Dausa", "Dholpur", "Dungarpur", "Hanumangarh", "Jaipur", "Jaisalmer", "Jalore", "Jhalawar", "Jhunjhunu", "Jodhpur", "Karauli", "Kota", "Nagaur", "Pali", "Pratapgarh", "Rajsamand", "Sawai", "Madhopur", "Sikar", "Sirohi", "Sri Ganganagar", "Tonk", "Udaipur"],
	      "Sikkim": ["East Sikkim", "North Sikkim", "South Sikkim", "West Sikkim"],
	      "Tamil Nadu": ["Ariyalur", "Chengalpattu", "Chennai", "Coimbatore", "Cuddalore", "Dharmapuri", "Dindigul", "Erode", "Kallakurichi", "Kanchipuram", "Kanyakumari", "Karur", "Krishnagiri", "Madurai", "Nagapattinam", "Namakkal", "Nilgiris", "Perambalur", "Pudukkottai", "Ramanathapuram", "Ranipet", "Salem", "Sivaganga", "Tenkasi", "Thanjavur", "Theni", "Thoothukudi  (Tuticorin)", "Tiruchirappalli", "Tirunelveli", "Tirupathur", "Tiruppur", "Tiruvallur", "Tiruvannamalai", "Tiruvarur", "Vellore", "Viluppuram", "Virudhunagar"],
	      "Telangana": ["Adilabad", "Bhadradri", "Hyderabad", "Jagitial", "Jangaon", "Jayashankar Bhupalpally", "Jogulamba Gadwl", "Kamareddy", "Karimnagar", "Khammam", "Komaram Bheem", "Mahabubabad", "Mahabubnagar", "Mancherial", "Medak", "Medchal–Malkajgiri", "Mulugu", "Nagarkurnool", "Narayanpet", "Nalgonda", "Nirmal", "Nizamabad", "Peddapalle", "Rajanna Sircilla", "Ranga Reddy", "Sangareddy", "Siddipet", "Suryapet", "Vikarabad", "Wanaparthy", "Warangal", "Yadadri", "Mulugu", "Narayanpet"],
	      "Tripura": ["Agartala", "Dhamanagar", "Udaipur", "Kailasahar", "Bishalgarh", "Telimura", "Khowai", "Belonia", "Melaghar", "Mohanpur", "Ambassa", "Ranirbazar", "Sanitirbazar", "Kumarghat", "Sonamura", "Panisagrar", "Amarpur", "Jirania", "Kamalpur", "Sabroom"],
	      "Uttar Pradesh": ["Lucknow", "Kanpur", "Ghazibad", "Agra", "Merut", "Varansi", "Prayagraj", "Bareilly", "Aligarh", "Muradabad", "Saharanpur", "Gorakhpur", "Faizabad", "Jhansi", "Muzaffarnagar", "Mathura-Vrindavan", "Budan", "Rampur", "Shahjhanpur", "Farrukhabad-cum-Fategarh", "Ayodhya Cantt", "Maunath Bhanjan", "Hapur", "Noida", "Etwah", "Mirzapur-cum-Vindhyachal", "Bulandshar", "Sambhal", "Amroha", "Hradoi", "Fatehpur", "Raebareli", "Orai", "Sitapur", "Baharich", "Modinagar", "Unnao", "Jaunpur", "Lakhimpur", "Hathras", "Banda", "Pilibhit", "Pandit Deen Dayal Upadhyaya Nagar", "Barabanki", "Khuraj", "Gonda", "Mainpur", "Lalitpur", "Etah", "Deoria", "Ujhani", "Ghazipur", "Sultanpur", "Azamgarh", "Bijnor", "Sahaswan", "Basati", "Chandausi", "Akbarpur", "Ballia", "Tanda", "Greater Noida", "Shikohabad", "Shamli", "Awagarh", "Kasganj"],
	      "Uttarakhand": ["Dehradun", "Haridwar", "Roorkee", "Haldwani", "Rudrapur", "Kashipur", "Rishikesh", "Pithoragarh", "Ramnagar", "Kichha", "Manglaur", "jaspur", "Kotdwara", "Nanital", "Almora", "Mussoorie", "Sitarganj", "Bazpur", "Pauri", "Tehri", "Nagla", "Laksar", "Chamoli Gopeshwar", "Umru Khurd", "Srinagar"],
	      "West Bengal": ["Kolkata", "Asansol", "Siliguri", "Durgapur", "Bardhaman", "Malda", "Baharmpur", "Habra", "Kharagpur", "Shantipur", "Dhankuni", "Dhulian", "Ranaghat", "Halidia", "Raiganj", "Krishnanagar", "Nabadwip", "Medinipur", "Jalpaiguri", "Balurghat", "Basirhat", "Bankura", "Chakdaha", "Darjeeling", "Alipurduar", "Purulia", "Jangipur", "Bangaon", "Cooch Behar"]

	    }


function makeSubmenu(value, cityId) {
    if (value.length == 0) {
      document.getElementById(cityId).innerHTML = "<option></option>";
    } 
    else {
      var citiesOptions = "";
      for (let city in citiesByState[value]) {
        citiesOptions += "<option>" + citiesByState[value][city] + "</option>";
      }
      document.getElementById(cityId).innerHTML = citiesOptions;
    }
}

