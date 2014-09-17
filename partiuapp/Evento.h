//
//  Evento.h
//  partiuapp
//
//  Created by Rhuan Andrade da Costa on 11/08/14.
//  Copyright (c) 2014 partiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Evento : NSObject

@property (nonatomic, strong) NSString * eid;
@property (nonatomic, strong) NSString * nome;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) NSString * latitude;
@property (nonatomic, strong) NSString * longitude;
@property (nonatomic, strong) NSString * endereco;
@property (nonatomic, strong) NSString * privacidade;
@property (nonatomic, strong) NSString * descricao;
@property (nonatomic, strong) NSString * picCover;
@property (nonatomic, strong) NSString * picSquare;


//Methods
- (id) initWithEventoID: (NSString *) eID andNome: (NSString *) eNome andDate: (NSString *) eDate andLatitude: (NSString *) eLatitude andLongitude: (NSString *) eLongitude andEndereco: (NSString *) eEndereco andPrivacidade: (NSString *) ePrivacidade andDescricao: (NSString *) eDescricao andPicCover: (NSString *) ePicCover andPicSquare: (NSString *) ePicSquare;

@end
