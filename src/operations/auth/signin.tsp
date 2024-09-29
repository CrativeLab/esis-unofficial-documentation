using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace ESIS;
/**
 * Нэвтрэх нэр, Нууц үг ашиглан нэвтрэхэд хэрэглэг мэдээллүүдийг дамжуулна.
 *
 * Хэрвээ нэвтрэх боломжтой бол SUCCESS_CODE 200
 * Хэрвээ нэвтрэх боломжгүй бол SUCCESS_CODE 201
 * **statusCode Өөрчлөлт ордоггүйг анхаарна үү!**
 */
@summary("Нэвтрэх")
@tag("Auth")
@post
@route("/signin")
op signin(
  /**
   * Нэвтрэх нэр
   * @example es00000000
   */
  userName: string,

  /**
   * Нууц үг
   */
  password: string,
): SigninResponse.Ok | SigninResponse.Unauthorized;

namespace SigninResponse {
  /**
   * Нэвтрэх боломжтой тохиолдолд
   */
  model Ok {
    @statusCode status: 200;
    @body body: {
      SUCCESS_CODE: 200;
      RESPONSE_MESSAGE: "Амжилттай холбогдлоо";
      RESULT: UserInfo;
    };
  }

  model UserInfo {
    /**
     * Систем дахь хэрэглэгчийн ID
     */
    userId: string;

    /**
     * Цахим журнал ашиглах эрхтэй эсэх
     */
    journalStatus: "Y" | "N";

    /**
     * Хэрэглэгчийн ID
     */
    personId: string;

    /**
     * Сургалтын байгуулгийн ID
     */
    institutionId: string;

    /**
     * Хичээлийн жил
     */
    academicYear: string;

    /**
     * Нэр
     */
    displayName: string;

    /**
     * Сургалтийн байгуулгийн төрөл
     */
    orgType: string;

    /**
     * Хэрэглэгчийн төрөл
     */
    groupName: "teacher" | "manager";

    /**
     * Нийгмийн ажилтан эсэх
     */
    socialWorker: boolean;

    /**
     * Нэвтрэх нэр
     */
    userName: string;

    /**
     * Нэвтэрхэд ашгилах JWT Token
     */
    token: string;
  }

  /**
   * Нэвтрэх боломжгүй тохиолдолд
   */
  @error
  model Unauthorized {
    @body body: {
      SUCCESS_CODE: 201;
      RESPONSE_MESSAGE: "Системд хандах эрх байхгүй байна";
      RESULT: "";
    };
  }
}
