-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2022 at 03:37 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fitpros`
--

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `did` int(11) NOT NULL,
  `dname` text NOT NULL,
  `dimage` text NOT NULL,
  `ddescription` text NOT NULL,
  `dsymptoms` text NOT NULL,
  `dprevention` text NOT NULL,
  `dexercise` text NOT NULL,
  `ddiet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`did`, `dname`, `dimage`, `ddescription`, `dsymptoms`, `dprevention`, `dexercise`, `ddiet`) VALUES
(1, 'Heart Disease', 'https://media.istockphoto.com/vectors/man-and-woman-have-chest-pain-symptoms-different-types-of-heart-vector-id1323619842?k=20&m=1323619842&s=612x612&w=0&h=aa5c40padYGgergOkwvi-hivFOpnXTlttAdDrGeodns=', 'Heart disease describes a range of conditions that affect your heart. heart diseases include:  blood vessel disease, such as coronary artery disease, heart rhythm problems (arrhythmias), heart defects you\'re born with (congenital heart defects), heart valve disease, disease of the heart muscle, heart infection', 'Chest pain or discomfort/upper back or neck pain/Indigestion/Heartburn/Nausea or vomiting', 'Try to limit saturated fats/Foods high in sodium/Limit alcohol', 'Walking/Swimming/Jogging/Biking', 'Fruits and vegetables/Whole grains/ Nuts/Fish/Poultry/Vegetable oils'),
(3, 'Diabetes', 'https://www.lalpathlabs.com/blog/wp-content/uploads/2020/03/1-2-1024x813.jpg', 'Diabetes is a chronic (long-lasting) health condition that affects how your body turns food into energy. Most of the food you eat is broken down into sugar (also called glucose) and released into your bloodstream. When your blood sugar goes up, it signals your pancreas to release insulin.', 'Urinate a lot/Very thirsty nature/Lose weight without trying/Very hungry all the time/Have blurry vision', 'Lose extra weight. Losing weight reduces the risk of diabetes./Be more physically active./Eat healthy plant foods. Plants provide vitamins, minerals and carbohydrates in your diet./Eat healthy fats./Skip fad diets and make healthier choices. ', 'Walking/Cycling/Swimming/Team Sports/Aerobic Dance/Weightlifting', 'Fruits and vegetable/Whole grains such as whole wheat./ Protein such as lean meats/ Nonfat or low-fat dairy'),
(4, 'High Blood Pressure', 'https://www.medstarhealth.org/-/media/project/mho/medstar/services/h3_high-blood-pressure.jpg?h=410&iar=0&w=730&hash=8692F8FFA3E6ADDDB0D115854C20EFDC', 'High blood pressure (also referred to as HBP, or hypertension) is when your blood pressure, the force of blood flowing through your blood vessels, is consistently too high.', 'Severe headaches/Nosebleed/Fatigue or confusion/Vision problems/Chest pain', 'Eating healthily/Maintaining a healthy weight/Taking regular exercise/Drinking alcohol in moderation and not smoking', 'Thirty minutes a day of biking or stationary cycling, or three 10-minute blocks of cycling./Ten minutes of brisk or moderate walking three times a day./Hiking./Desk treadmilling or pedal pushing./Swimming.', 'Grains: 6 to 8 servings a day./Vegetables: 4 to 5 servings a day./Fruits: 4 to 5 servings a day./Fat-free or low-fat dairy products: 2 to 3 servings a day./Lean meats, poultry and fish: six 1-ounce servings or fewer a day./Nuts, seeds and legumes: 4 to 5 servings a week.'),
(5, 'High Cholesterol', 'https://www.drugwatch.com/wp-content/uploads/Healthy-Blood-Cholesterol-Levels-by-Age-and-Sex-640x0-c-default.jpg', 'High cholesterol is when you have too much of a fatty substance called cholesterol in your blood. It\'s mainly caused by eating fatty food, not exercising enough, being overweight, smoking and drinking alcohol. It can also run in families.', 'Can have no symptoms, but people may experience:/Heart attack/Peripheral artery disease/or stroke/A blood test is the only way to detect if you have it.', 'Eat a low-salt diet that emphasizes fruits, vegetables and whole grains./Limit the amount of animal fats and use good fats in moderation./Lose extra pounds and maintain a healthy weight./Quit smoking./Exercise on most days of the week for at least 30 minutes./Drink alcohol in moderation, if at all.', 'Walking/Running/Cycling/Resistance Training: Pushups, Stomach crunches, Weightlifting, Squats/Organized sports and other activities', 'Limit foods with cholesterol./Eat plenty of soluble fiber: Whole-grain cereals such as oatmeal and oat bran/Fruits such as apples, bananas, oranges, pears, and prunes/Legumes such as kidney beans, lentils, chick peas, black-eyed peas, and lima beans/Eat fish that are high in omega-3 fatty acids./Eat lots of fruits and vegetables./Limit salt. You should try to limit the amount of sodium (salt) that you eat to no more than 2,300 milligrams (about 1 teaspoon of salt) a day.'),
(6, 'Thyroid/Hypothyroidism', 'https://www.ucontrolbilling.com/wp-content/uploads/2021/09/hypothyroidism-causes.jpg', 'A condition in which the thyroid gland doesn\'t produce enough thyroid hormone.\r\nHypothyroidism\'s deficiency of thyroid hormones can disrupt such things as heart rate, body temperature and all aspects of metabolism. Hypothyroidism is most prevalent in older women.', 'Experiencing anxiety, irritability and nervousness./Having trouble sleeping./Losing weight/\r\nHaving an enlarged thyroid gland or a goiter/\r\nHaving muscle weakness and tremors/\r\nExperiencing irregular menstrual periods or having your menstrual cycle stop.', 'You can’t prevent hypothyroidism./While some risk factors may contribute to the development of this thyroid condition (including pituitary disorders, iodine deficiencies, congenital disease, and pregnancy)/Hypothyroidism is most often caused by factors out of your control. Instead, it’s more important to be aware of the signs of hypothyroidism and to see your doctor if you suspect any of your symptoms could be related.', 'Yoga: \r\nBeginner, gentle, and yin yoga are good places to start\r\nSome yoga studios or videos may offer practices designed for thyroid care\r\nYoga offers cardio, strength, flexibility, and balance benefits/Walking/Elliptical or exercise bike: Both the elliptical and exercise bike offer a low-impact cardio workout that is more intense than walking\r\nMonitor your heart rate while exercising, and aim for a low-intensity workout at first, working your way up to higher heart rates as you feel comfortable/Resistance bands:  \r\nResistance bands offer a gentle way to build strength without lifting weights/Tai Chi: \r\nTai Chi is an ancient practice originating in China as a martial art. It involves a series of slow, meditative exercises', 'Foods containing iodine: cheese,\r\nmilk,\r\niodized table salt,\r\nsaltwater fish/Foods containing selenium: \r\nSelenium is a micronutrient that plays a role in the production of thyroid hormones and has antioxidant activity. Thyroid tissue naturally contains it. Foods rich in selenium include:\r\nBrazil nuts, tuna, shrimp, beef, turkey, chicken/Foods containing zinc: legumes, pumpkin seeds, yogurt'),
(7, 'Asthma', 'https://image.shutterstock.com/image-vector/human-anatomy-asthma-diagram-illustration-260nw-1862260579.jpg', 'Asthma is a condition in which your airways narrow and swell and may produce extra mucus. This can make breathing difficult and trigger coughing, a whistling sound (wheezing) when you breathe out and shortness of breath. For some people, asthma is a minor nuisance.', 'Shortness of breath./\r\nChest tightness or pain./\r\nWheezing when exhaling, which is a common sign of asthma in children./\r\nTrouble sleeping caused by shortness of breath, coughing or wheezing./\r\nCoughing or wheezing attacks that are worsened by a respiratory virus, such as a cold or the flu.', 'Follow your asthma action plan./\r\nGet vaccinated for influenza and pneumonia./\r\nIdentify and avoid asthma triggers./\r\nMonitor your breathing./\r\nIdentify and treat attacks early./\r\nTake your medication as prescribed./\r\nPay attention to increasing quick-relief inhaler use.', 'Swimming. Swimming is one of the most recommended exercises for people with asthma./\r\nWalking. As a low-intensity activity, walking is another great choice./\r\nHiking./\r\nRecreational biking./\r\nShort-distance track and field./\r\nSports with short bursts of activity.', 'Eat to maintain a healthy weight. Being overweight can worsen asthma. Even losing a little weight can improve your symptoms. Learn how to eat right to maintain a healthy weight over the long term./\r\nEat plenty of fruits and vegetables. They\'re a good source of antioxidants such as beta carotene and vitamins C and E, which may help reduce lung swelling and irritation (inflammation) caused by cell-damaging chemicals known as free radicals./\r\nAvoid allergy-triggering foods. Allergic food reactions can cause asthma symptoms. In some people, exercising after eating an allergy-causing food leads to asthma symptoms./\r\nTake in vitamin D. People with more-severe asthma may have low vitamin D levels. Milk, eggs and fish such as salmon all contain vitamin D.'),
(8, 'Tuberculosis (Tb)', 'https://solutionpharmacy.in/wp-content/uploads/2021/05/Tuberculosis-TB.jpg', 'Tuberculosis (TB) is a potentially serious infectious disease that mainly affects the lungs. The bacteria that cause tuberculosis are spread from person to person through tiny droplets released into the air via coughs and sneezes. Most people infected with the bacteria that cause tuberculosis don\'t have symptoms. ', 'Coughing for three or more weeks./\r\nCoughing up blood or mucus./\r\nChest pain, or pain with breathing or coughing./\r\nUnintentional weight loss./\r\nFatigue./\r\nFever./\r\nNight sweats./\r\nChills.', 'Getting a diagnosis and treatment early./\r\nStaying away from other people until there is no longer a risk of infection./\r\nWearing a mask, covering the mouth, and ventilating rooms', 'Walking/ \r\nStationary cycling and/ \r\nWeight training/', 'Calorie Dense Foods: Calorie dense foods that are nutrient rich can meet up the rising metabolic demands of the TB patient and can also prevent further weight loss. Foods like banana, cereal porridge, peanut chikki, wheat and ragi are quite beneficial for TB patients./\r\nFoods Rich in Vitamin A, C and E: Fruits and vegetables like orange, mango, sweet pumpkin and carrots, guava, amla, tomato, nuts and seeds are an excellent source of Vitamin A, C and E. These foods must be included in the daily diet regime of a TB patient./\r\nProtein Rich Foods: TB patients tend to experience loss in appetite. It is very important for them to indulge in protein-rich foods like eggs, paneer and soya chunks as they are quite rich in protein. These foods can be absorbed easily by the body and can give you the required energy./\r\nFoods Rich in B Complex Vitamins: Whole grain cereals, nuts, seeds, fish and chicken are quite rich in B complex vitamins. These foods must be consumed by a TB patient in moderation.'),
(9, 'Dengue', 'https://ehealth.eletsonline.com/wp-content/uploads/2021/12/Dengue-Malaria-and-Chikungunya.jpg', 'Dengue is a mosquito-borne viral disease that has rapidly spread to all regions of WHO in recent years. Dengue virus is transmitted by female mosquitoes mainly of the species Aedes aegypti and, to a lesser extent, Ae. albopictus. These mosquitoes are also vectors of chikungunya, yellow fever and Zika viruses.', 'Headache/\r\nMuscle, bone or joint pain/\r\nNausea/\r\nVomiting/\r\nPain behind the eyes/\r\nSwollen glands/\r\nRash', 'Prevent dengue by avoiding mosquito bites./\r\nUse insect repellent.\r\nwear long-sleeved shirts and long pants, and control mosquitoes inside and outside your home./\r\n', 'In this recovery phase it is necessary to include exercise in your daily regime which could include walking or lightweight exercise or also free hand exercises./\r\nStart with walking at a slow pace, the slower you start the better it goes for the body.', 'Lean meats such as chicken, lean red meat and fish/\r\nLiver/\r\nMilk and dairy products/\r\nEggs/\r\nBeans, chickpeas, lentils, peas/\r\nWater, coconut water, natural fruit juices.');

-- --------------------------------------------------------

--
-- Table structure for table `userdisease`
--

CREATE TABLE `userdisease` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `bloodgroup` varchar(3) NOT NULL,
  `disease` text NOT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdisease`
--

INSERT INTO `userdisease` (`id`, `email`, `weight`, `height`, `age`, `bloodgroup`, `disease`, `comment`) VALUES
(1, 'kushwahkalash11@gmail.com', 65, 170, 18, 'O+', 'Thyroid/Hypothyroidism', 'muze patla hona hai'),
(2, 'anshulshirbhate77434@gmail.com', 54, 170, 18, 'A+', 'High Blood Pressure', 'Need to lower the blood pressure'),
(3, 'parvezamaan9@gmail.com', 82, 178, 20, 'O+', 'Diabetes', 'Need to maintain good health'),
(4, 'tanush@gmail.com', 72, 179, 17, 'A+', 'High Cholesterol', 'Need to get cure'),
(5, 'chaudharishreyash424@gmail.com', 70, 182, 19, 'A+', 'Heart Disease', 'Need to lower the heart pain!'),
(6, 'ramesh@gmail.com', 95, 178, 25, 'AB-', 'High Cholesterol', 'Need to get healthy'),
(7, 'janhavi@gmail.com', 40, 153, 18, 'B+', 'Diabetes', 'Need to cure diabetes'),
(8, 'raj@gmail.com', 77, 173, 18, 'A+', 'Heart Disease', 'Need to cure myself'),
(9, 'ramumale@gmail.com', 56, 170, 18, 'A+', 'Heart Disease', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `gender` text NOT NULL,
  `address` text NOT NULL,
  `password` varchar(50) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_no`, `gender`, `address`, `password`, `date`) VALUES
(1, 'Anshul Shirbhate', 'anshulshirbhate77434@gmail.com', '8380056699', 'Male', 'Moti Nagar, Amravati', 'Anshul@1234', '0000-00-00'),
(7, 'Amaan Parvez', 'parvezamaan9@gmail.com', '8678776574', 'Male', 'Navsari, Amravati', 'Amaan@1234', '2022-03-25'),
(13, 'Tanush Agarkar', 'tanush@gmail.com', '766567567', 'Male', 'Rajapeth, Amravati', 'Tanush@1234', '2022-04-02'),
(19, 'Kalash Kushwah', 'kushwahkalash11@gmail.com', '8897482323', 'Male', 'Arni, Yavatmal', 'Kalash@1234', '2022-04-08'),
(21, 'Shreyash Chaudhari', 'chaudharishreyash424@gmail.com', '7875715777', 'Male', 'Arni, Yavatmal', 'Shreyash@1234', '2022-04-12'),
(22, 'Ramesh Mishra', 'ramesh@gmail.com', '8765432109', 'Male', 'Panchawati, Amravati', 'Ramesh@1234', '2022-04-13'),
(23, 'Janhavi Akarte', 'janhavi@gmail.com', '5767565672', 'Female', 'Amravati', 'Akarte@1234', '2022-04-13'),
(24, 'Raj  Mamarde', 'raj@gmail.com', '45678903445', 'Male', 'Rajapeth, Amravati', 'Raj@1234', '2022-04-13'),
(25, 'Ram Umale', 'ramumale@gmail.com', '7475757575', 'Male', 'Amravati', 'Ram@1234', '2022-04-20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `userdisease`
--
ALTER TABLE `userdisease`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `userdisease`
--
ALTER TABLE `userdisease`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
