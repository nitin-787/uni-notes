class CloudStorageException implements Exception {
  const CloudStorageException();
}

// C in CRUD
class CouldNotCreateNoteException extends CloudStorageException {}

// R in CRUD
class CouldNotGetAllNoteException extends CloudStorageException {}

// U in CRUD
class CouldNotUpdatesNoteException extends CloudStorageException {}

// D in CRUD
class CouldNotDeleteNoteException extends CloudStorageException {}
