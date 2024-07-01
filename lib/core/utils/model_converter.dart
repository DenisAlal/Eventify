part of core;

abstract class ModelConverter<ReturnType> {
  ReturnType convertModel();
}

abstract class EntityConverter<ReturnType> {
  ReturnType convertEntity();
}
