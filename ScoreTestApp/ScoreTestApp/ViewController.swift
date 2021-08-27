//
//  ViewController.swift
//  test-score
//
//  Created by Nayeon Kim on 2021/08/26.
//

import UIKit
import CoreML

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == schoolNamePicker{
            return schoolName.count
        }
        
        else if pickerView == schoolSettingPicker {
            return schoolSetting.count
        }
        
        else if pickerView == schoolTypePicker {
            return schoolType.count
        }
        
        else if pickerView == classroomPicker {
            return classroom.count
        }
        
        else if pickerView == teachingMethodPicker {
            return teachingMethod.count
        }
        
        else{  return 0 }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == schoolNamePicker{
            return schoolName[row]
        }
        
        else if pickerView == schoolSettingPicker {
            return schoolSetting[row]
        }
        
        else if pickerView == schoolTypePicker {
            return schoolType[row]
        }
        
        else if pickerView == classroomPicker {
            return classroom[row]
        }
        
        else if pickerView == teachingMethodPicker {
            return teachingMethod[row]
        }
        
        else {return "?"}
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == schoolNamePicker{
            schoolOhe = row
        }
        
        else if pickerView == schoolSettingPicker {
            schoolsettingOhe = row
        }
        
        else if pickerView == schoolTypePicker {
            schooltypeOhe = row
        }
        
        else if pickerView == classroomPicker {
            classroomOhe = row
        }
        
        else if pickerView == teachingMethodPicker {
            teachingmethodOhe = row
        }
    }
    
    
    let schoolName = ["ANKYI", "CCAAW", "CIMBB", "CUQAM", "DNQDD", "FBUMG", "GJJHK",
                  "GOKXL", "GOOBU", "IDGFP", "KFZMY", "KZKKE", "LAYPA", "OJOBU",
                  "QOQTS", "UAGPU", "UKPGS", "UUUQX", "VHDHF", "VKWQH", "VVTVA",
                  "ZMNYA", "ZOWMK"]
    let schoolSetting = ["Urban", "Suburban", "Rural"]
    let schoolType = ["Non-public", "Public"]
    let classroom = ["6OL", "ZNS", "2B1", "EPS", "IQN", "PGK", "UHU", "UWK", "A33",
                     "EID", "HUJ", "PC6", "1Q1", "BFY", "OMI", "X6Z", "2AP", "PW5",
                     "ROP", "ST7", "XXJ", "197", "5LQ", "JGD", "HCB", "NOR", "X78",
                     "YUC", "ZDT", "ENO", "TSA", "VA6", "18K", "CXC", "HKF", "PBA",
                     "U6J", "W8A", "05H", "98D", "G2L", "P2A", "XZM", "1VD", "21Q",
                     "2BR", "3D0", "5JK", "O6A", "QTU", "AJ1", "J8J", "RA5", "5SZ",
                     "6U9", "FS3", "XJ8", "0N7", "3XJ", "RK7", "SUR", "X2O", "XZ4",
                     "1SZ", "62L", "NWZ", "S98", "08N", "9AW", "IPU", "KXB", "PGH",
                     "XXE", "6C1", "AE1", "H7S", "P8I", "SSP", "CD8", "J6X", "KR1",
                     "341", "D33", "DFQ", "GYM", "IEM", "7BL", "A93", "TB5", "YTB",
                     "1UU", "4NN", "V77", "CII", "Q0E", "QA2", "ZBH"]
    let teachingMethod = ["Standard", "Experimental"]
    
    var schoolOhe:Int = 0
    var schoolsettingOhe: Int = 0
    var schooltypeOhe: Int = 0
    var classroomOhe: Int = 0
    var teachingmethodOhe: Int = 0
    
    var school:[Double] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var school_setting:[Double] = [0,0,0]
    var school_type:[Double] = [0,0]
    var classroom_:[Double] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var teaching_method:[Double] = [0,0]
    var n_student:[Double] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var gender:[Double] = [0,0]
    var lunch:[Double] = [0,0]
    
    var text = ""
    
    @IBOutlet weak var schoolNamePicker: UIPickerView!
    @IBOutlet weak var schoolSettingPicker: UIPickerView!
    @IBOutlet weak var schoolTypePicker: UIPickerView!
    @IBOutlet weak var classroomPicker: UIPickerView!
    @IBOutlet weak var teachingMethodPicker: UIPickerView!
    
    @IBOutlet weak var studentNumberTF: UITextField!
    
    @IBOutlet weak var genderSC: UISegmentedControl!
    @IBOutlet weak var lunchSC: UISegmentedControl!
    
    
    @IBOutlet weak var resultButton: UIButton!
    
    
    let model = scores() //모델 인스턴스 생성

    override func viewWillAppear(_ animated: Bool) {
        resultButton.isEnabled = true
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        schoolNamePicker.delegate = self
        schoolNamePicker.dataSource = self
        schoolSettingPicker.delegate = self
        schoolSettingPicker.dataSource = self
        schoolTypePicker.delegate = self
        schoolTypePicker.dataSource = self
        classroomPicker.delegate = self
        classroomPicker.dataSource = self
        teachingMethodPicker.delegate = self
        teachingMethodPicker.dataSource = self
        
        studentNumberTF.delegate = self
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("button pressed")
        schoolNameOHE(ohe: schoolOhe)
        schoolSettingOHE(ohe: schoolsettingOhe)
        schoolTypeOHE(ohe: schooltypeOhe)
        classroomOHE(ohe: classroomOhe)
        teachingMethodOHE(ohe: teachingmethodOhe)
        
        nStudentOHE(nStudent: Int(studentNumberTF.text!)!)
        genderOHE(gen: genderSC.selectedSegmentIndex)
        lunchOHE(l: lunchSC.selectedSegmentIndex)
        
        print(school, school_setting, school_type, classroom_, teaching_method, n_student, gender, lunch)
        //print(n_student[14])
        
        let model_output = try! model.prediction(school_0: school[0], school_1: school[1], school_10: school[10], school_11: school[11], school_12: school[12], school_13: school[13], school_14: school[14], school_15: school[15], school_16: school[16], school_17: school[17], school_18: school[18], school_19: school[19], school_2: school[2], school_20: school[20], school_21: school[21], school_22: school[22], school_3: school[3], school_4: school[4], school_5: school[5], school_6: school[6], school_7: school[7], school_8: school[8], school_9: school[9], school_setting_0: school_setting[0], school_setting_1: school_setting[1], school_setting_2: school_setting[2], school_type_0: school_type[0], school_type_1: school_type[1], classroom_0: classroom_[0], classroom_1: classroom_[1], classroom_10: classroom_[10], classroom_11: classroom_[11], classroom_12: classroom_[12], classroom_13: classroom_[13], classroom_14: classroom_[14], classroom_15: classroom_[15], classroom_16: classroom_[16], classroom_17: classroom_[17], classroom_18: classroom_[18], classroom_19: classroom_[19], classroom_2: classroom_[2], classroom_20: classroom_[20], classroom_21: classroom_[21], classroom_22: classroom_[22], classroom_23: classroom_[23], classroom_24: classroom_[24], classroom_25: classroom_[25], classroom_26: classroom_[26], classroom_27: classroom_[27], classroom_28: classroom_[28], classroom_29: classroom_[29], classroom_3: classroom_[3], classroom_30: classroom_[30], classroom_31: classroom_[31], classroom_32: classroom_[32], classroom_33: classroom_[33], classroom_34: classroom_[34], classroom_35: classroom_[35], classroom_36: classroom_[36], classroom_37: classroom_[37], classroom_38: classroom_[38], classroom_39: classroom_[39], classroom_4: classroom_[4], classroom_40: classroom_[40], classroom_41: classroom_[41], classroom_42: classroom_[42], classroom_43: classroom_[43], classroom_44: classroom_[44], classroom_45: classroom_[45], classroom_46: classroom_[46], classroom_47: classroom_[47], classroom_48: classroom_[48], classroom_49: classroom_[49], classroom_5: classroom_[5], classroom_50: classroom_[50], classroom_51: classroom_[51], classroom_52: classroom_[52], classroom_53: classroom_[53], classroom_54: classroom_[54], classroom_55: classroom_[55], classroom_56: classroom_[56], classroom_57: classroom_[57], classroom_58: classroom_[58], classroom_59: classroom_[59], classroom_6: classroom_[6], classroom_60: classroom_[60], classroom_61: classroom_[61], classroom_62: classroom_[62], classroom_63: classroom_[63], classroom_64: classroom_[64], classroom_65: classroom_[65], classroom_66: classroom_[66], classroom_67: classroom_[67], classroom_68: classroom_[68], classroom_69: classroom_[69], classroom_7: classroom_[7], classroom_70: classroom_[70], classroom_71: classroom_[71], classroom_72: classroom_[72], classroom_73: classroom_[73], classroom_74: classroom_[74], classroom_75: classroom_[75], classroom_76: classroom_[76], classroom_77: classroom_[77], classroom_78: classroom_[78], classroom_79: classroom_[79], classroom_8: classroom_[8], classroom_80: classroom_[80], classroom_81: classroom_[81], classroom_82: classroom_[82], classroom_83: classroom_[83], classroom_84: classroom_[84], classroom_85: classroom_[85], classroom_86: classroom_[86], classroom_87: classroom_[87], classroom_88: classroom_[88], classroom_89: classroom_[89], classroom_9: classroom_[9], classroom_90: classroom_[90], classroom_91: classroom_[91], classroom_92: classroom_[92], classroom_93: classroom_[93], classroom_94: classroom_[94], classroom_95: classroom_[95], classroom_96: classroom_[96], teaching_method_0: teaching_method[0], teaching_method_1: teaching_method[1], n_student_14_0: n_student[14], n_student_15_0: n_student[15], n_student_16_0: n_student[16], n_student_17_0: n_student[17], n_student_18_0: n_student[18], n_student_19_0: n_student[19], n_student_20_0: n_student[20], n_student_21_0: n_student[21], n_student_22_0: n_student[22], n_student_23_0: n_student[23], n_student_24_0: n_student[24], n_student_25_0: n_student[25], n_student_26_0: n_student[26], n_student_27_0: n_student[27], n_student_28_0: n_student[28], n_student_29_0: n_student[29], n_student_30_0: n_student[30], n_student_31_0: n_student[31], gender_0: gender[0], gender_1: gender[1], lunch_0: lunch[0], lunch_1: lunch[1])
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as! ResultVC
        
        print(model_output.posttest)
        
        let result = Array(String(model_output.posttest))
        print(result)
        
        text.append(result[0])
        text.append(result[1])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ResultVC else {return}
        //destinationVC.resultScore.text = text
    }
    
    func schoolNameOHE(ohe: Int) {
        school[ohe] = 1.0
    }
    
    func schoolSettingOHE(ohe: Int){
        school_setting[ohe] = 1.0
    }
    
    func schoolTypeOHE(ohe: Int){
        school_type[ohe] = 1.0
    }
    
    func classroomOHE(ohe: Int){
        classroom_[ohe] = 1.0
    }
    
    func teachingMethodOHE(ohe: Int){
        teaching_method[ohe] = 1.0
    }
    
    func nStudentOHE(nStudent: Int){
        n_student[nStudent] = 1.0
    }
    
    func genderOHE(gen: Int){
        gender[gen] = 1.0
    }
    
    func lunchOHE(l: Int){
        lunch[l] = 1.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)

   }

}

