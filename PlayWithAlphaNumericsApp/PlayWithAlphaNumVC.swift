//
//  PlayWithAlphaNumVC.swift
//  PlayWithAlphaNumericsApp
//
//  Created by Maheshwar Punyam Anand on 9/9/23.
//

import UIKit

class PlayWithAlphaNumVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var GenButton: UIButton!
    
    @IBOutlet weak var ManiButton: UIButton!
    
    @IBOutlet weak var NumBtn: UISwitch!
    
    @IBOutlet weak var StrBtn: UISwitch!
    
    
    
    @IBOutlet weak var firstLBL: UILabel!
    
    @IBOutlet weak var HeadLBL: UILabel!
    @IBOutlet weak var secondLBL: UILabel!
    
    @IBAction func FirstStepper(_ sender: UIStepper) {
        firstLBL.text=String(Int(sender.value))
    }
    @IBAction func SecondStepper(_ sender: UIStepper) {
        secondLBL.text=String(Int(sender.value))
    }
    
    @IBOutlet weak var MessageTV: UITextView!
    
    
    @IBOutlet weak var firstStrTF: UITextField!
    
    @IBOutlet weak var secondStrTF: UITextField!
    
    
    @IBAction func stringSWCH(_ sender: UISwitch) {
        if StrBtn.isEnabled{
            ManiButton.isEnabled=sender.isOn
        }
        else{
            ManiButton.isOpaque=sender.isOpaque
        }
        }
    
    
    @IBAction func ResetBtn(_ sender: UIButton) {
        MessageTV.text=""
        firstLBL.text="0"
        secondLBL.text="0"
        firstStrTF.text=""
        secondStrTF.text=""
        
    }
    @IBAction func numberSWCH(_ sender: UISwitch) {
        if NumBtn.isEnabled{
            GenButton.isEnabled=sender.isOn
        }
        else{
            GenButton.isOpaque=sender.isOpaque
        }
    }
    
    
    @IBAction func generatePattern(_ sender: UIButton){
        
        var row=0
        var col=0
        if let text = self.firstLBL.text, let value = Int(text) {
                row=value
            }
        if let text1 = self.secondLBL.text, let value1 = Int(text1) {
                col=value1
            }
        
        //MessageTV.text="Hello"
        MessageTV.text=""
        
        if(row==0 && col==0){
            MessageTV.text="First Number and Second Number are Invalid. Please provide a value greater than zero"
        }
        else if(row==0 && col>0){
            MessageTV.text="First Number is Invalid. Please provide a value greater than zero"
        }
        else if(row>0 && col==0){
            MessageTV.text="Second Number is Invalid. Please provide a value greater than zero"
        }
        else{
            for num in (1...row){
                for cols in (1...col){
                    if( num==1 || num==row){
                        MessageTV.text+=String("❄️ ")
                    }
                    else if (cols==1 || cols==col){
                        MessageTV.text+=String("❄️ ")
                    }
                    else{
                        
                        
                        if(num==cols){
                            MessageTV.text+=String("🎅 ")
                        }
                        else if((num+cols)%2==0){
                            MessageTV.text+=String("🎅 ")
                        }
                        else{
                            MessageTV.text+=String("🌲 ")
                        }
                        
                    }
                    // MessageTV.text+=String("🌲 ")
                }
                MessageTV.text+="\n"
            }
            
        }
    }
    
    @IBAction func manipulateStrings(_ sender: UIButton) {
        var str1="nithinreddy"//firstStrTF.text ?? " "
        var str2="vemula" //secondStrTF.text ?? " "
        //var temp=String(str1 + str2)
       // MessageTV.text="Concatenation of the Strings,\(temp)"
        var temp = str1 + str2
        MessageTV.text="Concatenation of two strings result is \"\(temp)\"\n"
        var cnt=0,vs=0
        for char in temp{
            switch char{
            case "a","e","i","o","u":
                cnt+=1
            default:
                vs+=1
            }
        }
        MessageTV.text+="Vowel count in the String is \(cnt)\n"
        MessageTV.text+="Consonent count in the String is \(vs)\n"
        var uc=0,lm=0,wc=temp.count,lk=0,ind=1
        ind = -(ind)
        var str4=temp
        
        for char in temp{
            for ch in str4{
                ind=ind+1
                print("String4 is :\(str4)")
                if(ch == char){
                    
                    uc+=1
                    print(uc)
                    print("***\(ch)")
                    if(uc>1){
                        //Character cha=ch
                        
                        //str4.replacingOccurrences(of: cha, with: "")
                        print(ch)
                        str4.remove(at: str4.index(str4.startIndex, offsetBy: ind-1))
                        uc=uc-1
                    }
                }
            }
            if(uc==1){
                lm+=1
            }
            
            uc=0
            ind=0
            
        }
        print("The str4 is :\(str4)")
        MessageTV.text+="The number of Unique Characters in \"\(temp) is : \(str4.count)\n"
        MessageTV.text+="The Reverse of the given string is :\(temp.reversed())"
        
        
        
    }
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
