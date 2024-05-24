export interface ICar {
  drive(): void;
}

export interface CarModule {
  Car: new () => ICar;
}
