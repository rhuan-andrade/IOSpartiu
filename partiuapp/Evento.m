//
//  Evento.m
//  partiuapp
//
//  Created by Rhuan Andrade da Costa on 11/08/14.
//  Copyright (c) 2014 partiu. All rights reserved.
//

#import "Evento.h"

@implementation Evento

@synthesize eid, nome, date, latitude, longitude, endereco, privacidade, descricao, picCover, picSquare;

- (id) initWithEventoID: (NSString *) eID andNome: (NSString *) eNome andDate: (NSString *) eDate andLatitude: (NSString *) eLatitude andLongitude: (NSString *) eLongitude andEndereco: (NSString *) eEndereco andPrivacidade: (NSString *) ePrivacidade andDescricao: (NSString *) eDescricao andPicCover: (NSString *) ePicCover andPicSquare: (NSString *) ePicSquare
{
    self = [super init];
    if (self)
    {
        eid = eID;
        nome = eNome;
        date = eDate;
        latitude = eLatitude;
        longitude = eLongitude;
        endereco = eEndereco;
        privacidade = ePrivacidade;
        descricao = eDescricao;
        picCover = ePicCover;
        picSquare = ePicSquare;
    }
    
    return self;
}

@end
