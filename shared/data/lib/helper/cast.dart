T cast<T>(dynamic data, {required T defaultValue}) {
  return data is T ? data : defaultValue;
}