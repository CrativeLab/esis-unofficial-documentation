namespace ESIS;

model Student {
  personId: string,
  /**
   * Регистрийн дугаар 
   */
  primaryNidNumber: string,
  studentGroupID: string,

  /**
   * Овог
   */
  lastname: string,
  /**
   * Нэр
   */
  firstname: string,
  /**
   * Хүйс
   */
  genderName: Gender,

  /**
   * Google account хаяг
   */
  googleMail: string,
  /**
   * Google account нууц үг
   */
  googlePassword: string,
  /**
   * medle.mn хаяг
   */
  username: string,
  /**
   * medle.mn нууц үг
   */
  userPassword: string,

  /**
   * Системд бүртгэгдсэн огноо
   */
  effectiveStartDate: plainDate,
  /**
   * Системд хүчингүй болох огноо 
   */
  effectiveEndDate: plainDate,
}

alias Gender = "Эрэгтэй" | "Эмэгтэй";