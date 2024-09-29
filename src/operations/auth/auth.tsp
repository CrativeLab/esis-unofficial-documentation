using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace ESIS;
/**
 * Нэвтрэх нэр, Нууц үг ашиглан нэвтрэх мэдээллийг шалгахад ашгилдаг
 *
 * Хэрвээ нэвтрэх боломжтой бол SUCCESS_CODE 200
 * Хэрвээ нэвтрэх боломжгүй бол SUCCESS_CODE 201
 * **statusCode Өөрчлөлт ордоггүйг анхаарна үү!**
 */
@summary("Нэвтрэх мэдээлэл шалгах")
@tag("Auth")
@post
@route("/auth")
op authAccount(
  /**
   * Нэвтрэх нэр
   * @example es00000000
   */
  userName: string,

  /**
   * Нууц үг
   */
  password: string,
): AuthResponse.Ok | AuthResponse.Unauthorized;

namespace AuthResponse {
  /**
   * Нэвтрэх боломжтой тохиолдолд
   */
  model Ok {
    @statusCode status: 200;
    @body body: {
      SUCCESS_CODE: 200;
      RESPONSE_MESSAGE: "Амжилттай холбогдлоо";
      RESULT: null;
    };
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
