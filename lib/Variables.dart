List<String> indianStates = [
  "Andhra Pradesh",
  "Arunachal Pradesh",
  "Assam",
  "Bihar",
  "Chhattisgarh",
  "Goa",
  "Gujarat",
  "Haryana",
  "Himachal Pradesh",
  "Jharkhand",
  "Karnataka",
  "Kerala",
  "Madhya Pradesh",
  "Maharashtra",
  "Manipur",
  "Meghalaya",
  "Mizoram",
  "Nagaland",
  "Odisha",
  "Punjab",
  "Rajasthan",
  "Sikkim",
  "Tamil Nadu",
  "Telangana",
  "Tripura",
  "Uttar Pradesh",
  "Uttarakhand",
  "West Bengal"
      "Andaman and Nicobar Islands",
  "Chandigarh",
  "Dadra and Nagar Haveli and Daman and Diu",
  "Lakshadweep",
  "Delhi",
  "Puducherry",
  "Ladakh",
  "Jammu and Kashmir"
];
Map<String, List<String>> indianDistricts = {
  // **STATES**
  "Andhra Pradesh": [
    "Anantapur", "Chittoor", "East Godavari", "Guntur", "Kadapa",
    "Krishna", "Kurnool", "Nellore", "Prakasam", "Srikakulam",
    "Visakhapatnam", "Vizianagaram", "West Godavari"
  ],
  "Arunachal Pradesh": [
    "Tawang", "West Kameng", "East Kameng", "Papum Pare", "Kurung Kumey",
    "Kra Daadi", "Lower Subansiri", "Upper Subansiri", "West Siang",
    "East Siang", "Siang", "Upper Siang", "Lower Siang", "Dibang Valley",
    "Lower Dibang Valley", "Lohit", "Namsai", "Changlang", "Tirap", "Longding"
  ],
  "Assam": [
    "Baksa", "Barpeta", "Biswanath", "Bongaigaon", "Cachar", "Charaideo",
    "Chirang", "Darrang", "Dhemaji", "Dhubri", "Dibrugarh", "Goalpara",
    "Golaghat", "Hailakandi", "Hojai", "Jorhat", "Kamrup", "Kamrup Metropolitan",
    "Karbi Anglong", "Karimganj", "Kokrajhar", "Lakhimpur", "Majuli", "Morigaon",
    "Nagaon", "Nalbari", "Sivasagar", "Sonitpur", "South Salmara-Mankachar",
    "Tinsukia", "Udalguri", "West Karbi Anglong"
  ],
  "Bihar": [
    "Araria", "Arwal", "Aurangabad", "Banka", "Begusarai", "Bhagalpur",
    "Bhojpur", "Buxar", "Darbhanga", "East Champaran", "Gaya", "Gopalganj",
    "Jamui", "Jehanabad", "Kaimur", "Katihar", "Khagaria", "Kishanganj",
    "Lakhisarai", "Madhepura", "Madhubani", "Munger", "Muzaffarpur", "Nalanda",
    "Nawada", "Patna", "Purnia", "Rohtas", "Saharsa", "Samastipur", "Saran",
    "Sheikhpura", "Sheohar", "Sitamarhi", "Siwan", "Supaul", "Vaishali", "West Champaran"
  ],
  "Chhattisgarh": [
    "Balod", "Baloda Bazar", "Balrampur", "Bastar", "Bemetara", "Bijapur",
    "Bilaspur", "Dantewada", "Dhamtari", "Durg", "Gariaband", "Janjgir-Champa",
    "Jashpur", "Kabirdham", "Kanker", "Kondagaon", "Korba", "Koriya", "Mahasamund",
    "Mungeli", "Narayanpur", "Raigarh", "Raipur", "Rajnandgaon", "Sukma",
    "Surajpur", "Surguja"
  ],
  "Goa": ["North Goa", "South Goa"],
  "Gujarat": [
    "Ahmedabad", "Amreli", "Anand", "Aravalli", "Banaskantha", "Bharuch",
    "Bhavnagar", "Botad", "Chhota Udaipur", "Dahod", "Dang", "Devbhoomi Dwarka",
    "Gandhinagar", "Gir Somnath", "Jamnagar", "Junagadh", "Kheda", "Kutch",
    "Mahisagar", "Mehsana", "Morbi", "Narmada", "Navsari", "Panchmahal", "Patan",
    "Porbandar", "Rajkot", "Sabarkantha", "Surat", "Surendranagar", "Tapi",
    "Vadodara", "Valsad"
  ],
  "Haryana": [
    "Ambala", "Bhiwani", "Charkhi Dadri", "Faridabad", "Fatehabad", "Gurugram",
    "Hisar", "Jhajjar", "Jind", "Kaithal", "Karnal", "Kurukshetra",
    "Mahendragarh", "Nuh", "Palwal", "Panchkula", "Panipat", "Rewari", "Rohtak",
    "Sirsa", "Sonipat", "Yamunanagar"
  ],

  // More states can be added here...

  // **UNION TERRITORIES**
  "Andaman and Nicobar Islands": ["Nicobar", "North and Middle Andaman", "South Andaman"],
  "Chandigarh": ["Chandigarh"],
  "Dadra and Nagar Haveli and Daman and Diu": ["Dadra and Nagar Haveli", "Daman", "Diu"],
  "Lakshadweep": ["Lakshadweep"],
  "Delhi": [
    "Central Delhi", "East Delhi", "New Delhi", "North Delhi", "North East Delhi",
    "North West Delhi", "Shahdara", "South Delhi", "South East Delhi", "South West Delhi",
    "West Delhi"
  ],
  "Puducherry": ["Karaikal", "Mahe", "Puducherry", "Yanam"],
  "Jammu and Kashmir": [
    "Anantnag", "Bandipora", "Baramulla", "Budgam", "Doda", "Ganderbal", "Jammu",
    "Kathua", "Kishtwar", "Kulgam", "Kupwara", "Poonch", "Pulwama", "Rajouri",
    "Ramban", "Reasi", "Samba", "Shopian", "Srinagar", "Udhampur"
  ],
  "Ladakh": ["Kargil", "Leh"],

"Himachal Pradesh": [
"Bilaspur", "Chamba", "Hamirpur", "Kangra", "Kinnaur", "Kullu",
"Lahaul and Spiti", "Mandi", "Shimla", "Sirmaur", "Solan", "Una"
],
"Jharkhand": [
"Bokaro", "Chatra", "Deoghar", "Dhanbad", "Dumka", "East Singhbhum",
"Garhwa", "Giridih", "Godda", "Gumla", "Hazaribagh", "Jamtara",
"Khunti", "Koderma", "Latehar", "Lohardaga", "Pakur", "Palamu",
"Ramgarh", "Ranchi", "Sahebganj", "Seraikela Kharsawan",
"Simdega", "West Singhbhum"
],
"Karnataka": [
"Bagalkot", "Ballari", "Belagavi", "Bengaluru Rural", "Bengaluru Urban",
"Bidar", "Chamarajanagar", "Chikkaballapur", "Chikkamagaluru",
"Chitradurga", "Dakshina Kannada", "Davanagere", "Dharwad",
"Gadag", "Hassan", "Haveri", "Kalaburagi", "Kodagu", "Kolar",
"Koppal", "Mandya", "Mysuru", "Raichur", "Ramanagara", "Shivamogga",
"Tumakuru", "Udupi", "Uttara Kannada", "Vijayapura", "Yadgir"
],
"Kerala": [
"Alappuzha", "Ernakulam", "Idukki", "Kannur", "Kasaragod",
"Kollam", "Kottayam", "Kozhikode", "Malappuram", "Palakkad",
"Pathanamthitta", "Thiruvananthapuram", "Thrissur", "Wayanad"
],
"Madhya Pradesh": [
"Agar Malwa", "Alirajpur", "Anuppur", "Ashoknagar", "Balaghat",
"Barwani", "Betul", "Bhind", "Bhopal", "Burhanpur", "Chhatarpur",
"Chhindwara", "Damoh", "Datia", "Dewas", "Dhar", "Dindori", "Guna",
"Gwalior", "Harda", "Hoshangabad", "Indore", "Jabalpur", "Jhabua",
"Katni", "Khandwa", "Khargone", "Mandla", "Mandsaur", "Morena",
"Narsinghpur", "Neemuch", "Panna", "Raisen", "Rajgarh", "Ratlam",
"Rewa", "Sagar", "Satna", "Sehore", "Seoni", "Shahdol", "Shajapur",
"Sheopur", "Shivpuri", "Sidhi", "Singrauli", "Tikamgarh", "Ujjain",
"Umaria", "Vidisha"
],
"Maharashtra": [
"Ahmednagar", "Akola", "Amravati", "Aurangabad", "Beed", "Bhandara",
"Buldhana", "Chandrapur", "Dhule", "Gadchiroli", "Gondia", "Hingoli",
"Jalgaon", "Jalna", "Kolhapur", "Latur", "Mumbai City", "Mumbai Suburban",
"Nagpur", "Nanded", "Nandurbar", "Nashik", "Osmanabad", "Palghar",
"Parbhani", "Pune", "Raigad", "Ratnagiri", "Sangli", "Satara",
"Sindhudurg", "Solapur", "Thane", "Wardha", "Washim", "Yavatmal"
],
"Manipur": [
"Bishnupur", "Chandel", "Churachandpur", "Imphal East",
"Imphal West", "Jiribam", "Kakching", "Kamjong", "Kangpokpi",
"Noney", "Pherzawl", "Senapati", "Tamenglong", "Tengnoupal",
"Thoubal", "Ukhrul"
],
"Meghalaya": [
"East Garo Hills", "East Jaintia Hills", "East Khasi Hills",
"North Garo Hills", "Ri Bhoi", "South Garo Hills",
"South West Garo Hills", "South West Khasi Hills",
"West Garo Hills", "West Jaintia Hills", "West Khasi Hills"
],
"Mizoram": [
"Aizawl", "Champhai", "Hnahthial", "Khawzawl", "Kolasib",
"Lawngtlai", "Lunglei", "Mamit", "Saiha", "Saitual", "Serchhip"
],
"Nagaland": [
"Chümoukedima", "Dimapur", "Kiphire", "Kohima", "Longleng",
"Mokokchung", "Mon", "Niuland", "Noklak", "Peren", "Phek",
"Shamator", "Tseminyu", "Tuensang", "Wokha", "Zünheboto"
],
"Odisha": [
"Angul", "Balangir", "Balasore", "Bargarh", "Bhadrak",
"Boudh", "Cuttack", "Deogarh", "Dhenkanal", "Gajapati",
"Ganjam", "Jagatsinghpur", "Jajpur", "Jharsuguda",
"Kalahandi", "Kandhamal", "Kendrapara", "Kendujhar",
"Khordha", "Koraput", "Malkangiri", "Mayurbhanj",
"Nabarangpur", "Nayagarh", "Nuapada", "Puri",
"Rayagada", "Sambalpur", "Subarnapur", "Sundargarh"
],
"Punjab": [
"Amritsar", "Barnala", "Bathinda", "Faridkot", "Fatehgarh Sahib",
"Fazilka", "Ferozepur", "Gurdaspur", "Hoshiarpur", "Jalandhar",
"Kapurthala", "Ludhiana", "Mansa", "Moga", "Mohali", "Muktsar",
"Nawanshahr", "Pathankot", "Patiala", "Rupnagar", "Sangrur",
"Tarn Taran"
],
"Rajasthan": [
"Ajmer", "Alwar", "Banswara", "Baran", "Barmer", "Bharatpur",
"Bhilwara", "Bikaner", "Bundi", "Chittorgarh", "Churu",
"Dausa", "Dholpur", "Dungarpur", "Hanumangarh", "Jaipur",
"Jaisalmer", "Jalore", "Jhalawar", "Jhunjhunu", "Jodhpur",
"Karauli", "Kota", "Nagaur", "Pali", "Pratapgarh", "Rajsamand",
"Sawai Madhopur", "Sikar", "Sirohi", "Sri Ganganagar", "Tonk",
"Udaipur"
],
  "Tamil Nadu": [
    "Ariyalur", "Chengalpattu", "Chennai", "Coimbatore", "Cuddalore",
    "Dharmapuri", "Dindigul", "Erode", "Kallakurichi", "Kanchipuram",
    "Kanyakumari", "Karur", "Krishnagiri", "Madurai", "Mayiladuthurai",
    "Nagapattinam", "Namakkal", "Nilgiris", "Perambalur", "Pudukkottai",
    "Ramanathapuram", "Ranipet", "Salem", "Sivaganga", "Tenkasi",
    "Thanjavur", "Theni", "Thoothukudi", "Tiruchirappalli", "Tirunelveli",
    "Tirupattur", "Tiruppur", "Tiruvallur", "Tiruvannamalai",
    "Tiruvarur", "Vellore", "Viluppuram", "Virudhunagar"
  ],

  "Telangana": [
    "Adilabad", "Bhadradri Kothagudem", "Hyderabad", "Jagtial",
    "Jangaon", "Jayashankar Bhupalpally", "Jogulamba Gadwal",
    "Kamareddy", "Karimnagar", "Khammam", "Komaram Bheem Asifabad",
    "Mahabubabad", "Mahabubnagar", "Mancherial", "Medak",
    "Medchal-Malkajgiri", "Mulugu", "Nagarkurnool", "Nalgonda",
    "Nirmal", "Nizamabad", "Peddapalli", "Rajanna Sircilla",
    "Rangareddy", "Sangareddy", "Siddipet", "Suryapet",
    "Vikarabad", "Wanaparthy", "Warangal", "Hanamkonda",
    "Warangal Rural", "Yadadri Bhuvanagiri"
  ]


};
