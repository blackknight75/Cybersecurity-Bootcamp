# Suspicious Email 1

![Suspicious_Email1](/Networking/assets/suspicious_email1.png) 

```plaintext
Delivered-To: <redacted>@gmail.com
Received: by 2002:a05:7022:1182:b0:75:b0d3:e803 with SMTP id ov2csp503684dlb;
        Wed, 21 Feb 2024 11:21:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9OKQaH2RErhU17/P39xu8zWZV0khriypVrjzkC8SF5JJFQAX0z50OGdCN81+KROz/cVtaDVZKErcTW2iGs6dEUWSWoN0NE4xm
X-Received: by 2002:a17:906:1392:b0:a3f:1afa:115f with SMTP id f18-20020a170906139200b00a3f1afa115fmr2999976ejc.31.1708543274196;
        Wed, 21 Feb 2024 11:21:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708543274; cv=none;
        d=google.com; s=arc-20160816;
        b=Nx/IyIsEfTWiltiKte9WE85iTvBuB1s4Ek8MEWQrE1N3KXL1UjIzbHeZHwKxSxdbxn
         v7+26ELiZcQLoJ9MM0dPuj554+xSLm8iud1HNs8nmjOQTdr2D3BooX361mZzurPv3gk0
         x8bfgIC0wWeHeX5FWcVUNK18i4cPEuq2rs6MtMOJvZpjDcJSGI1NUUd/R+xKOZzl6juv
         sb1joGweKI/X5DVFsPzYCByZnPnHo54ZChEHOuVoWoiYVBdhabDd1/Mf93TdL/k2K6Tv
         3TuyWz/9wjqmaQ61Ae2xvOAHvNVaJtRU3fOzQIS7ZKM2tw8oECUcg2nTp5Z/Th1JeX7q
         Caqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=tiAnOmulLXmYrb7oyvu1iwy8WIKUXsCANpoaKsx5Zok=;
        fh=LP/TfhPyrdHP3ERtYdvhVvrReYEYatGHKBigQy2R5w8=;
        b=dK7SMZdkL6IriJmESn4Gx8vMi7DeL5OkUMj7Vf7r1dFA5E7NzPkGXe+5Iz/D1Eccm0
         fB8lSzlqaOxKKNrXWY5FkHj6/T8nyWPZxmJnES1VuYkrhe1sVNyNsQ2nKBvT+QGz/5ly
         foghXxvyX+ohxP05Qb2lyVR47SfneNM/qTlUBxKB9gzfi3l+oXSWs4GWDGeU8hKLq+jl
         IqtvG0PmBGdqO+wpGsOTR3bWKgsBbOvtAjOhzEqej3d+7tFzTs+SGpeCcupaUiKaj+OL
         QjALoSJy2KNKIZcPzLYEet7bAeW67DSWYuYG52X0aCXbgsinr1Moix5vXH9O2qfjz8VJ
         cQzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=glXyeR5F;
       spf=pass (google.com: domain of yolindaeurick326@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=yolindaeurick326@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <yolindaeurick326@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p14-20020a1709060e8e00b00a3ecdce2ad6sor1682023ejf.5.2024.02.21.11.21.13
        (Google Transport Security);
        Wed, 21 Feb 2024 11:21:14 -0800 (PST)
Received-SPF: pass (google.com: domain of yolindaeurick326@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=glXyeR5F;
       spf=pass (google.com: domain of yolindaeurick326@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=yolindaeurick326@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708543273; x=1709148073; dara=google.com;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tiAnOmulLXmYrb7oyvu1iwy8WIKUXsCANpoaKsx5Zok=;
        b=glXyeR5FF6N/JcJHrOgS+OkAUJWFODaDvmjWqNyCILYT91sgMq3HvtKboWpD+UKqep
         e4PPr+UEKC5m8Cvomx5n3xprjVmkF7Z2FRSh7FkEKdYa7CgVfYIRD8EfVAoqchg7l2SF
         F3vB2/u9CnmsAgR5+y4N3lpozxTBb0Ekn7iXiZHQAq+oFINh1bpNXKJamb/grX9DZYl5
         KNjdbkJdYeqR/6l832oMPtRI+5GzSt1oxrpV6Vd551w4My/JTLbDQljth+zAl94TOplG
         EU5ucGhTDmUCHWEz/PNs4s4MsPRpDbi4AZkqZj4+UPZgZ7AFz28xv5iewsrkk/mR5yBo
         2TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708543273; x=1709148073;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tiAnOmulLXmYrb7oyvu1iwy8WIKUXsCANpoaKsx5Zok=;
        b=sy/YukapWVu8VWhhz403UUoigQecZBY/aO/6ixbsh/rHGtqMrwmsnczg3KTM+i9+tC
         /DL7fNdiTKj+7vE2PitpmHEVmNEWRGSw02kHlDGC8oyehzqaZaY3ucF6houAU0kFMxIO
         IobxSnupp7oWjS9Nqj2K4jW+8UVhs8FxeKcjUkqfnp8keuOmekuU18Tx7Vvj4WxcbmtP
         2mnlQRJ7CjxAEM4nDNszOnmQ1W+ntxqi9Qm6bhSd2k3V6pekNDuJKd2CKWdZE65rOXl5
         xuHk2qXFPB8MdqQhgr9vS5LMViBC+KC3SyGjf99P+vRjRCPYIl9nkNBayV0VdBaLIjCK
         QP1w==
X-Forwarded-Encrypted: i=1; AJvYcCV/+gT1yIyeXqGFVYuVJvMWxSxhRfJgXt9ZJ+OdxvCyDfaBhY28NFpXBwlZGL5eW7dHzYfaEE1QwnCUZ36kVU18MIltY60/2egCiV59k6rtQnuZ6pM8DXV9dMSoH0ZJhqpIqlWP+oVm4knWSL4keDFMfUcWXBaTzE4HJi2ckOhIfyWuf+4fIz4bLk6icUhGlVUIwR+qWdFRFawskkPBUoZeIILDFDntaZdRBqZR9mWsw4AUX+j/StNNFZomkdv/K4OH4OQ1Nqku6gQIXpBcrPWD+/MOtihiRy3gzMGWjWcK5nZmskudYS58nD1b/BxbyEkU3jzHjZTMZvCc8/LoPwFq6EUztDTfZIJ5G1Ky/cyCZ2yohCS1KxBMzqcXlg/pKDXfTqoOGCU6rJuNA93+d1chZ1bts+7u8/a3DMSfS/uKPDtc9BOcl/uuYNhXwp+a4FXYpRCoPxCqQIzTHjWvBZGRcBRsN/RVxyoUh2fvO2vxFfWUkNE6LLRIAoLo2d1Y3OZOzt3Bq/rGjUaojQdUgVWCIg5Kk8uxICnNXhdVPDcuWKXCfp9hh2C2ocK0OKuPX49mmjtWz+fPH5O8lX2UWXE9mqjrfgJhHBWfK4rQPzswXTa6GUYR6Ol2oK7w8Rj/zowml9wHwApfNBufchpDWNFjgXacm1tJ2xoFfHXcs23H9POFGJHPQKcvGlvhAJSqSzQND65paq4F718AyeEh96X9Oiuye0p3Gjz3Yx4VcRpKzzLx9E9iyuejB8bwSNPVViARiITMejO0iylQDJa8g5Wk+ScSZgJ1hQ8PB0k/dovWKPR3tdaWuQAAYus=
X-Gm-Message-State: AOJu0YzYLdp1bosagRqIkT3T/ijrshIzqgvIeCXp3S0QcqJZy2lFi5QC KjAN5Oqsc1N0vZPkiz9V+mpeQTRKfCzS5eUcjQRVrSm/J14Ftqm8lZ+K07dRIZdG7CS3jkQtI5n 56mflu1gaAvIny3hYEZB6Ag8aSvk=
X-Google-Smtp-Source: AGHT+IEmkF/tIrdwt64Bax2Q2sGWD9mahQ0CbvTNshHqWUqeCE8XIYPbcN4/9K4a1rEBfXqQFFabohPymrvpTG7Nnbk=
X-Received: by 2002:aa7:c484:0:b0:565:789:3058 with SMTP id m4-20020aa7c484000000b0056507893058mr1711072edq.23.1708543273000; Wed, 21 Feb 2024 11:21:13 -0800 (PST)
MIME-Version: 1.0
From: Yolinda Eurick <yolindaeurick326@gmail.com>
Date: Thu, 22 Feb 2024 00:51:00 +0530
Message-ID: <CAJDF-dSu=G9v_3aRtHmidSByKJbaHcccP6kOnExPxAZ=Z9kA8Q@mail.gmail.com>
Subject: 
To: jaydenmaddentlza907@gmail.com, kuldeep.onlineexpert001@gmail.com, petesplumbinc@gmail.com, petesplumbingrepairllc@gmail.com, petespops@gmail.com, petespruyt@gmail.com, petesqualityremodeling@gmail.com, petesremodeling16@gmail.com, petesrestaurantoh@gmail.com, PetesteccatoRE@gmail.com, petesteinkopf@gmail.com, petesteinmetz194@gmail.com, petesteriyaki@gmail.com, petestoiletrentals@gmail.com, peterson suffrena <petesultimatemovers@gmail.com>, petethepopcorn@gmail.com, petevolution@gmail.com, petewallplumbing835@gmail.com, petewatson1952@gmail.com, petewhitbread@gmail.com, petewilliams5@gmail.com, petewillsellit@gmail.com, petewtucker@gmail.com, petey096@gmail.com, petey5809.main@gmail.com, peteytoth@gmail.com, Peter Zizzi <petezizzi@gmail.com>, petfairytale@gmail.com, petfectionist2020@gmail.com, petfoodconsults@gmail.com, petfooddeliveryph@gmail.com, petfoodelivers@gmail.com, petfoodgonewild@gmail.com, petfoodstpete1@gmail.com, petfriendlyapartmentsnyc@gmail.com, petgaragegrooming@gmail.com, Petgriimungdallas@gmail.com, petgroomer1215@gmail.com, Petgroomingbykristi@gmail.com, petgroomingbypriscilla@gmail.com, petgroomingbytiphani@gmail.com, Petgroomingdallas@gmail.com, petgroomingfurryfriends@gmail.com, petgroomingmatilu@gmail.com, petgroomingorlando@gmail.com, pethaven84@gmail.com, pethconstruction@gmail.com, petheadvet@gmail.com, pethealthctr@gmail.com, petheldesigns@gmail.com, petherm917@gmail.com, petho.zoltan44@gmail.com, pethouseclinic@gmail.com, peticularlyperfect@gmail.com, peticularpetz@gmail.com, peticure@gmail.com, PetieBradley1@gmail.com, petietucker@gmail.com, petillotson@gmail.com, petipuamiami@gmail.com, petit.eclair.photography@gmail.com, petitefeastutah@gmail.com, petitemagnoliaphoto@gmail.com, petitepawgrooming@gmail.com, petiteseatsnj@gmail.com, petitewoof@gmail.com, petiteworkshopcanada@gmail.com, petitjetedance@gmail.com, petitpaspsychiatric@gmail.com, petitthvac@gmail.com, petitwhyteteam@gmail.com, petjoybrentwood@gmail.com, petkingdom73@gmail.com, petkovannalisa@gmail.com, petlandolatheks@gmail.com, petlandshakopee@gmail.com, petlife.arrowhead@gmail.com, petlifeva@gmail.com, petlimo1@gmail.com, petlocksgrooming@gmail.com, petlodgeusa@gmail.com, petlossgriefrelief@gmail.com, petluckblog@gmail.com, Petluxinfo@gmail.com, petmar082306@gmail.com, petmatchmakerca@gmail.com, Petmeisters@gmail.com, Petmo.SanDiego@gmail.com, PetNannyAngie617@gmail.com, petnannyjs@gmail.com, petnannymelb@gmail.com, petnannynetwork@gmail.com, petnannypps@gmail.com, petnannyrva@gmail.com, petnificent2016@gmail.com, petnvy@gmail.com, petonconstruction@gmail.com, petoskeymancinos@gmail.com, petpal8215@gmail.com, Petpalaceconcierge@gmail.com, petpalaceproductions@gmail.com, petpallooza@gmail.com, Petpals34@gmail.com, petpalscopetsitting@gmail.com, petpalskc@gmail.com, petpalsmt@gmail.com, sheila catanzarite <petpalsofdallas@gmail.com>, petparlor1982@gmail.com, petpawlicyins@gmail.com, petpeevesllc@gmail.com, petperfection01@gmail.com, petpetparkmike@gmail.com, petpfmw@gmail.com, petplayhouseinc@gmail.com, petplaylandnc@gmail.com, petplex@gmail.com, petpolishers@gmail.com, petpompoms@gmail.com, petportraitsbydanielle@gmail.com, petproceo@gmail.com, petpsychcenter@gmail.com, petquestion@gmail.com, petra.hallman91@gmail.com, petra.seibertova@gmail.com, Petra Zayakosky <petra.zayakosky@gmail.com>, petra349@gmail.com, petrabeckerrealtor@gmail.com, Petrackplumbing@gmail.com, petradurova@gmail.com, PETRAFRANCIS22@gmail.com, PETRAHOF@gmail.com, petrakijoseph@gmail.com, petralouis144@gmail.com, petramalacc@gmail.com, petramasonry@gmail.com, petranchthornton@gmail.com, petrapetclinic@gmail.com, petraproperties01@gmail.com, petras.lex@gmail.com, petrasales33@gmail.com, PetrasWellnessStudio@gmail.com, petrecessinc@gmail.com, petreegardencenter@gmail.com, petrescuenetworkstl@gmail.com, petrescuesolutions@gmail.com, petreyrealestate11561@gmail.com, petrickdylan6@gmail.com, petrie.nick@gmail.com, petrieconcepts@gmail.com, petriefencedeck@gmail.com, petriko.petr@gmail.com, petriko04@gmail.com, petrillo.james@gmail.com, petrina78gourmetflavorsoftexas@gmail.com, petrinserepeat@gmail.com, petro.wow@gmail.com, petroaryaconst@gmail.com, petrocanada@gmail.com, petroffml@gmail.com, petrofjoe@gmail.com, petrohoroshko@gmail.com, petroleumwgpd@gmail.com, petroleumynho@gmail.com, petronehomeservices@gmail.com, petronyte.ruta@gmail.com, petropoliskhris@gmail.com, petropolitandoggrooming@gmail.com, petros.prionas@gmail.com, petrosyanart@gmail.com, PETROTECHSOLUTION15@gmail.com, petrov.elena@gmail.com, petrovnabain@gmail.com, petrushkok@gmail.com, pets0610@gmail.com, pets2groom@gmail.com, petsafe.foundation@gmail.com, petsalon2008@gmail.com, petsandpeeps4u@gmail.com, petsandplants1999@gmail.com, petsandplantskw@gmail.com, petsandvetsac@gmail.com, petsarepeachy@gmail.com, petsatpeaceal@gmail.com, PETSBYDONNA@gmail.com, petsbymj@gmail.com, petscompanion@gmail.com, petsdoo2@gmail.com, petservices.tlc@gmail.com, PetServices@gmail.com, petsesrealty@gmail.com, Petsetstayandplay@gmail.com, petsfirstvetctr@gmail.com, petsfirstwc@gmail.com, petsgroomer3@gmail.com, petshopboyz8@gmail.com, petsinharmonypa@gmail.com, petsitdavidson@gmail.com, Petsitplusjenny@gmail.com, petsitter12205@gmail.com, petsitter85@gmail.com, petsitter9768@gmail.com, petsitterHeather@gmail.com, petsittersofwestgeorgia@gmail.com, petsittersofyardley@gmail.com, petsittersplusgr@gmail.com, petsittingbyashley@gmail.com, petsittingbyjulie@gmail.com, petsittingbymelissaLA@gmail.com, petsittingca@gmail.com, Petsittinggreenbay@gmail.com, Petsitwithvic@gmail.com, petslo@gmail.com, PetsMakeLife@gmail.com, petsonacloud@gmail.com, petsonbroadwaynyc@gmail.com, petsontheshorevh@gmail.com, petsoundddc@gmail.com, Petspa@gmail.com, petspa2@gmail.com, petspabellevue@gmail.com, PetSpaRetreat@gmail.com, petsplacegrooming@gmail.com, petsquadchas@gmail.com, petsrule2017@gmail.com, petsrus.official@gmail.com, petstarrsalon@gmail.com, petstayandvacay@gmail.com, petstop.staff@gmail.com, petstopcentralil@gmail.com, petstopdesmoines@gmail.com, petstopfence@gmail.com, petstopveterinaryclinic@gmail.com, petstorenmore.apw@gmail.com, Petstylesgroomingsalon09@gmail.com, petstylesofelkton@gmail.com, petsuiteretreat2@gmail.com, petsupernanny718@gmail.com, petsworldaquatics@gmail.com, pettbutler90@gmail.com, pettcon4@gmail.com, pettengillfarm1792@gmail.com, petterdahlstromrealty@gmail.com, petterpage11@gmail.com, petteruc@gmail.com, pettigenteam@gmail.com, pettigrew.derek2@gmail.com, pettigrewdapdd@gmail.com, pettigrewplumbingandhvac@gmail.com, Jarred Pettijohn <pettijohnj@gmail.com>, pettingillcoun@gmail.com, pettini@gmail.com, pettipasmusic@gmail.com, pettit.joanna@gmail.com, pettitbryan@gmail.com, pettwayfs@gmail.com, pettyconstruction1@gmail.com, pettyjohnsraleighnc@gmail.com, pettykatherine452@gmail.com, pettythieftx@gmail.com, petucare@gmail.com, petuniasplaceorders@gmail.com, Petunityco@gmail.com, peturpetz@gmail.com, petvetonpatton@gmail.com, petvillagebrentwood@gmail.com, petvillagehospital@gmail.com, petvillagerockhill@gmail.com, petvinhomesinc@gmail.com, petwalkdenver@gmail.com, petwash24@gmail.com, petwasteyardspace@gmail.com, petway.ii@gmail.com, petwellnessclinicmd@gmail.com, petwellusa@gmail.com, petworldva@gmail.com, petworthroom4rent@gmail.com, petzeppelincle@gmail.com, petzone757@gmail.com, Petzpawlor@gmail.com, petzplazaperkins@gmail.com, peuclid@gmail.com, pevessey@gmail.com, pewaukeevision@gmail.com, pewterhanrose@gmail.com, pexindia2011@gmail.com, pexproduction@gmail.com, peybrown30@gmail.com, peyellwat021209@gmail.com, peyeprotruck21@gmail.com, peymanmcv@gmail.com, peysakh2007@gmail.com, Peyton.fiene08@gmail.com, peyton.thomas72@gmail.com, peytonahaley@gmail.com, peytonalford@gmail.com, peytonbrannock10@gmail.com, peytondjones@gmail.com, Peytonfree33@gmail.com, Peytongreene@gmail.com, peytonindustries@gmail.com, peytonjohansen@gmail.com, peytonkno21@gmail.com, peytonkyle8@gmail.com, peytonlambton@gmail.com, peytonlatta1994@gmail.com, peytonleeannhead@gmail.com, peytonmgardner1@gmail.com, peytonmsmith2022@gmail.com, peytonnaasz06@gmail.com, peytonneal.photo@gmail.com, peytonpeters7@gmail.com, peytonpse@gmail.com, peytonsdad2010@gmail.com, peytonsivatraining@gmail.com, peytonsjohnson@gmail.com, peytonspiefb@gmail.com, peytonwaters0123@gmail.com, peytonwessel92@gmail.com, pezaro3333@gmail.com, pezinoproperties@gmail.com, pezon.us@gmail.com, peztpro@gmail.com, pezza.personaltraining@gmail.com, pf.arizona@gmail.com, pf.phoenixfeathers@gmail.com, pf3d.can@gmail.com, <redacted> @gmail.com, PFACTN@gmail.com, pfafftownpetpawlor@gmail.com, pfagnan@gmail.com, pfalliance@gmail.com, pfarrell85@gmail.com, pfawley@gmail.com, pfboisvert@gmail.com, pfc773@gmail.com, pfceeatraining@gmail.com, pfcha32@gmail.com, pfcholicssolutions@gmail.com, PFCJax@gmail.com, pfclanning@gmail.com, pfclindard@gmail.com, pfdeland@gmail.com, pfdg.info@gmail.com, pfdmax@gmail.com, pfeffer.younique@gmail.com, pfeffergroupre@gmail.com, pfeffersaluminum@gmail.com, pfeiferhomeinspect@gmail.com, pfeiferplumbing@gmail.com, pfeiff33@gmail.com, pfeiffercustoms@gmail.com, pfeifferpforever2021@gmail.com, PFEIFFERSWAY@gmail.com, pfelsted@gmail.com, pfergpaint.live@gmail.com, pfesi46@gmail.com, pffgpresident@gmail.com, pffhardware@gmail.com, pffphx@gmail.com, pfgdesigns123@gmail.com, pfhu@gmail.com, pfhubbard@gmail.com, pfia2014@gmail.com, pfiasco4@gmail.com, pfinkenstadt@gmail.com, pfinn888@gmail.com, pfinv002@gmail.com, pfister916@gmail.com, pfitzarts@gmail.com, pfiwestern@gmail.com, pfiztech@gmail.com, pfk0101@gmail.com, pfkeithly@gmail.com, PFKELLOGG@gmail.com, PFLAG HANOVER <pflag.hanover@gmail.com>, pflag.santarosa@gmail.com, pflag.ventura.ca@gmail.com, pflagfresno@gmail.com, pflaggbg@gmail.com, pflagnapa@gmail.com, pflagnorfolk@gmail.com, pflagpeoria@gmail.com, pflagportlandmaine@gmail.com, pflagsturgeonbay@gmail.com, pflagyuma4u@gmail.com, pfletcher.spj@gmail.com, pfletcher12@gmail.com, Pfljen3@gmail.com, pfloridausa@gmail.com, pflowerg
Content-Type: multipart/mixed; boundary="000000000000df2ab30611e93a99"

--000000000000df2ab30611e93a99
Content-Type: multipart/alternative; boundary="000000000000df2ab10611e93a97"

--000000000000df2ab10611e93a97
Content-Type: text/plain; charset="UTF-8"



--000000000000df2ab10611e93a97
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--000000000000df2ab10611e93a97--
--000000000000df2ab30611e93a99
Content-Type: text/plain; charset="UTF-8"; name="@PayPal____Protection Key____@@7351278915318.txt"
Content-Disposition: attachment; filename="@PayPal____Protection Key____@@7351278915318.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_lsw6jh9w0>
X-Attachment-Id: f_lsw6jh9w0

UGF5UGFs4oSiIEFMRVJUICEhIQ0KDQpEYXRlOiAwMi0yMS0yMDI0DQoNCiA8IERlYXIgU3Vic2Ny
aWJlciA+DQoNCllvdXIgU3Vic2NyaXB0aW9uIHdpdGggR0VFSyBTUVVBRCB3aWxsIFJlbmV3IFRv
ZGF5LiBUaGlzIGlzIGEgcmVjZWlwdCBmb3IgeW91ciByZWNlbnQgcmVuZXdhbC4gDQpZb3VyIFBh
eVBhbCBhY2NvdW50IGxpbmtlZCB3aXRoIHlvdXIgR0VFSyBTUVVBRCBhY2NvdW50IGhhcyBiZWVu
IGF1dG8tZGViaXRlZCBmb3IgJDMyMi41MCBhbmQgeW91ciBhbm51YWwgc3Vic2NyaXB0aW9uIGhh
cyBiZWVuIGF1dG8gcmVuZXdlZCBzdWNjZXNzZnVsbHkuDQoNClRyYW5zYWN0aW9uIElEOiBYWFg5
MDEyMi0wMjMxMjc2NjE0NjEyNjcNCg0KUHJvZHVjdCBLZXk6IEFZUlotOTgyNy1VU0FBLTI4MjgN
Cg0KUmVuZXdhbCBBbW91bnQ6ICQzMjIuNTANCg0KUkVORVdBTCBTVU1NQVJZIDotDQoNCkdFRUsg
U1FVQUQgREVMVVhFDQoNClRvdGFsIDogJDMyMi41MA0KDQpJZiB5b3UgZG9uJ3QgYXV0aG9yaXNl
ZCB0aGlzIGNoYXJnZXMgeW91IGhhdmUgMTJocnMsIHRvIHRlcm1pbmF0ZSBhbmQgZ2V0IGFuIElu
c3RhbnQgcmVmdW5kIG9mIHlvdXIgDQphbm51YWwgc3Vic2NyaXB0aW9uIGJ5IGNvbnRhY3Rpbmcg
b3VyIGN1c3RvbWVyIHN1cHBvcnQgdGVhbSA6ICsxKDgzMykgNTEwLTQyNjcNCg0KVEhBTksgWU9V
IEZPUiBTVUJTQ1JJQklORyEhIA0KDQpDYXNlIG9mIGNhbmNlbGxhdGlvbiByZWFjaCB1cyBoZXJl
OiArMSg4MzMpIDUxMC00MjY3DQoNClBheVBhbOKEoiBTdXBwb3J0LiAxNTc5NiwgVGVtcGUsIEFy
aXpvbmEsIFVuaXRlZCBTdGF0ZXMNClBheVBhbOKEoiBJbmMsIEFsbCByaWdodCByZXNlcnZlZCBQ
cml2YWN5IC0gU2VjdXJpdHkgLSBUZXJtcyBvZiBTZXJ2aWNl
--000000000000df2ab30611e93a99--
```

## Red Flags

The email provided raises several red flags that are commonly associated with phishing attempts or suspicious emails. Here's a breakdown of what makes this email suspicious:

- **Unusual Email Subject and Content**: The email lacks a subject, which is uncommon for legitimate communication. Additionally, the body of the email contains a base64 encoded attachment with a name suggesting it's related to PayPal, a tactic often used in phishing to masquerade as legitimate entities.

- **Generic Greeting and Lack of Personalization**: The use of a generic greeting ("Dear Subscriber") instead of addressing the recipient by name is a common tactic in phishing emails to target a wide audience without personalization.

- **Urgency and Threat of Charges**: The email creates a sense of urgency by stating that a subscription with "GEEK SQUAD" will renew today and mentions a significant charge ($322.50). This pressure tactic is designed to prompt hasty actions from the recipient, such as clicking on malicious links or opening attachments without scrutiny.

- **Suspicious Attachment**: The presence of an attachment named "@PayPal____Protection Key____@@7351278915318.txt" that is base64 encoded is particularly alarming. Legitimate companies typically do not send unsolicited attachments, especially not in a format that obscures the content. This could potentially be malware or a script designed to compromise your device or steal sensitive information.

- **Request for Immediate Action**: The email urges the recipient to contact customer support within a very short window (12hrs) to terminate the subscription and get a refund. This sense of immediacy is a red flag for phishing, aiming to exploit the recipient's fear of losing money.

- **Suspicious Sender Email Address**: While the email appears to be from a Gmail address, the mismatch between the sender's email address and the purported service (GEEK SQUAD and PayPal) raises suspicions. Phishers often use spoofed or unrelated email addresses.

- **Large Number of Recipients**: The email is sent to a wide range of recipients, which is visible in the "To" field. This scattergun approach is typical of phishing campaigns aiming to reach as many potential victims as possible.

- **Lack of Professionalism**: The overall tone and formatting of the email lack the professionalism expected from a legitimate company. Errors, unusual phrasing, and the overall structure may indicate a phishing attempt.

- **Inclusion of a Contact Number**: The inclusion of a phone number for contact is a tactic used by phishers to gain more personal information from the recipient or to perpetrate further fraud.

Considering these factors, it's advisable to avoid opening the attachment, clicking any links, or responding to the email. Instead, directly contact the service provider (e.g., PayPal or Geek Squad) through official channels to verify any claims made in the email.

## Why are DKIM and DMARC passing

DKIM (DomainKeys Identified Mail) and DMARC (Domain-based Message Authentication, Reporting, and Conformance) are email authentication methods designed to detect email spoofing and ensure that messages are not altered in transit. The fact that DKIM and DMARC are passing in a suspicious email can be perplexing, but it doesn't necessarily guarantee the email is safe or legitimate. Here are a few reasons why these checks might pass even in phishing emails:

- **Compromised Account**: If the sender's email account (in this case, a Gmail account) is compromised, attackers can send phishing emails from the legitimate account itself. Since the email genuinely originates from the service's infrastructure (e.g., Gmail), it would naturally pass DKIM and DMARC checks, as these are designed to verify the authenticity of the sender's domain and the integrity of the message.

- **Legitimate Services Misuse**: Phishers sometimes exploit legitimate email sending services to dispatch their messages. If these services are configured to send emails on behalf of the user's domain and have DKIM and DMARC set up correctly, the fraudulent emails could still pass these authentication checks.

- **Domain Alignment**: DMARC policies check for alignment between the domain in the From header and the domain used in DKIM and SPF checks. If a phishing email is sent from a domain that the attacker controls and has properly configured DKIM and DMARC records for, these checks will pass. This is more common with domains that look similar to legitimate ones (domain spoofing) or use subdomains to deceive recipients.

- **Weak DMARC Policy**: The p=NONE policy in DMARC does not instruct receiving email servers to reject or quarantine emails that fail DMARC checks; it simply requests that they send reports of the failures. Attackers might take advantage of domains with weak DMARC policies to send emails that will pass these checks but not be acted upon aggressively by receiving servers.

- **Sophisticated Phishing Techniques**: Advanced attackers might find ways to bypass email authentication methods through various sophisticated techniques, including finding loopholes in the email infrastructure of targeted domains or exploiting the configuration mistakes in DMARC and DKIM setups.

It's essential to remember that while DKIM and DMARC are critical for improving email security, they are not foolproof. They should be part of a layered security approach that includes user education, advanced threat detection systems, and regular monitoring of email authentication reports. Users should always be wary of unsolicited emails, especially those urging immediate action or containing unexpected attachments, regardless of the email's authentication status.
