

abstract class KEndPoints {
  static String baseUrl =  'http://192.168.1.118:99/api/';

  static String login = '${baseUrl}User/AuthenticateUser';
  static String logout = '${baseUrl}User/LogOut';
  static String order = '${baseUrl}Driver/GetWorkOrders';
  static String reject_reasons = '${baseUrl}Lookup/GetFailToDeliverReasons';
  static String update_order = '${baseUrl}Driver/ChangeWorkOrderStatus';
  static String order_by_id = '${baseUrl}Driver/GetOrderBasicDetails';




}
