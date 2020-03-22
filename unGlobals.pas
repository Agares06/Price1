unit unGlobals;

interface

uses
  Vcl.Graphics,
  unJData;

const
  ExApp = 'Excel.Application';

  DflRequz: string = 'Общество с ограниченной ответственностью «Юничойс»'+
        #13#10+'223021 г. Минск, Меньковский тракт, 14а, пом. 1-16'+#13#10+
        'р/с  BY73BLNB30120000041245000933 BYN  в ОАО "БНБ-Банк", код BLNBBY2X,'
        +#13#10+'г. Минск, пр. Независимости, 87А'+#13#10+
        'УНП 691583669'+#13#10+'Тел. +375 29 132-30-30';
  CStrSetsFN: string = 'setts';

  LogoColor: TColor = 15509777;

type
  TPriceRec = record
    name: string;
    prc: double;
    link, pict_link: string;
  end;
  TPrice = array of TPriceRec;
  TPrices = array of TPrice;

  TGroupLink = record
    name, link: string;
  end;
  TGroup = array of TGroupLink;

  TSetts = record
    requz: string;
  end;

var
  PricesG, PricesCur: TPrices;
  ExcelG: OleVariant;
  GroupG: TGroup;
  FirstActivate: Boolean = True;
  FirstRefr: Boolean = True;
  SetG: TSetts;
  JDG: TJData;
  SetsFN1G: string;

implementation

end.
