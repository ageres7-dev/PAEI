//
//  getResult.swift
//  HW2.8-pael
//
//  Created by Brubrusha on 11/7/20.
//


extension Result {
    static func getResult(text: String) -> Result {
        var result = Result()
    
        
        switch text {
        case "Paei":
            result = Result(
                shortInfo: "Производитель",
                picture: "0",
                characteristic: "Прибыль — результат хорошего менеджмента. Производитель является тем руководителем, который способен его обеспечить. Это преданный своему делу профессионал, разбирающийся в потребностях клиентов и технологиях, которые могут их удовлетворить. Поэтому он всегда знает, что и как нужно делать для достижения результата. \nКроме того, менеджер P-типа на достаточно хорошем уровне выполняет функцию администрирования, что позволяет ему отладить процессы производства.",
                qualities: ["целеустремленность",
                            "упорство",
                            "любопытство",
                            "аналитичность",
                            "ответственность" ],
                skills: ["самоорганизация",
                         "тайм-менеджмент",
                         "управление событиями",
                         "управление ресурсами" ]
            )
        case "P---":
            result = Result(
                shortInfo: "Герой-одиночка",
                picture: "1",
                characteristic: "Это производитель, у которого практически не развиты функции администрирования, предпринимательства и интеграции. Поэтому он не умеет сгенерировать идеи, организовать их воплощение и сплотить команду. \nТем не менее, выяснив, в чем состоит задача, герой-одиночка всегда добивается ее решения, если при этом он не отвлекается на тушение возникающих то тут, то там пожаров. Поэтому он является идеальным исполнителем для реализации краткосрочных целей.",
                qualities: [ "целеустремленность",
                             "упорство",
                             "трудолюбие",
                             "верность" ],
                skills: [ "краткосрочное планирование",
                          "делегирование поручений",
                          "организация и тушение пожаров" ]
            )
        case "pAei":
            result = Result(
                shortInfo: "Администратор",
                picture: "2",
                characteristic: "Нельзя добиться результатов без тех, кто организовывает и контролирует процесс их достижения. С этим блестяще справляется администратор, который внимательно и методично работает над повышением эффективности организации. \nЯрко выраженный менеджер А-типа — это человек, который позаботится об организации рабочей среды, проконтролирует бюджет и спланирует достижение целей компании.",
                qualities: [ "внимательность",
                             "аналитичность",
                             "ответственность",
                             "методичность",
                             "критичность" ],
                skills: [ "самоорганизация",
                          "внедрение процессов",
                          "управление процессами",
                          "осведомленность" ]
            )
        case "paEi":
            result = Result(
                shortInfo: "Генератор идей ",
                picture: "3",
                characteristic: "Организация не существует в вакууме, она находится в условиях постоянно изменяющихся реалий. Генератор идей способен сложить воедино поступающую извне информацию и предложить свое видение, куда следует двигаться компании. Это и определяет ее действия в настоящем. \nМинус такого руководителя в том, что он мечется от одной идеи к другой, поэтому часто он не может довести начатое дело до конца.",
                qualities: [ "креативность",
                             "внимательность",
                             "дальновидность",
                             "интуиция" ],
                skills: [ "умение видеть полную картину",
                          "генерация идей" ]
            )
        case "PaEi":
            result = Result(
                shortInfo: "Предприниматель",
                picture: "4",
                characteristic: "Если менеджер обладает креативностью, чтобы трансформировать мечту в цель, а цель в реальность, то он является предпринимателем. Он всегда знает, чего хочет и почему. Предпринимателя раздражают идеи без результатов и результаты, за которыми не стоят большие идеи. \nТакой менеджер умеет разрабатывать видение будущего компании, которое диктует ей действия в настоящем. В результате организация прибыльна как в краткосрочной, так и долгосрочной перспективе.",
                qualities: [ "креативность",
                             "смелость",
                             "предприимчивость",
                             "дальновидность" ],
                skills: [ "умение видеть полную картину",
                          "стратегирование",
                          "генерация идей",
                          "управление ресурсами" ]
            )
        case "--E-" :
            result = Result(
                shortInfo: "Поджигатель",
                picture: "5",
                characteristic: "Поджигатель — это такой тип менеджера, который направляет всю свою неуемную энергию на генерацию и реализацию новых идей. При этом он редко доводит начатое дело до конца, так как в голове уже сформировано пару схематичных планов реализации других инноваций. \nПричины своих неудач поджигатель видит, как правило, в подчиненных, поэтому он придирчив к их работе и всегда готов назвать очередного крайнего.",
                qualities: [ "предприимчивость",
                             "энергичность",
                             "обаятельность",
                             "креативность" ],
                skills: [ "краткосрочная мотивация команды",
                          "делегирование неудач",
                          "наживание врагов",
                          "увольнение врагов",
                          "генерация идей" ]
            )
        case "paeI":
            result = Result(
                shortInfo: "Интегратор",
                picture: "6",
                characteristic: "Интегратор — это лидер, который создает в организации связи, обеспечивающие нормальное функционирование в настоящем и преемственность на будущее. Менеджер I-типа обладает креативным мышлением, ведь он действует на поле человеческих отношений, и его задача заключается в сплочении людей с самыми разными характерами и мотивацией. \nЕму удается добиться этого при помощи создания системы нравственных и поведенческих норм, благодаря которой организация осознает не механически, а как органическую целостность.",
                qualities: [ "лидерство",
                             "креативность",
                             "эмпатия",
                             "энергичность" ],
                skills: [ "формирование команды",
                          "сплочение команды",
                          "мотивация команды" ]
            )
        case "---I" :
            result = Result(
                shortInfo: "Горячий сторонник",
                picture: "7",
                characteristic: "Горячий сторонник — это политик-популист, который прислушивается ко мнению окружающих и встает на сторону самого поддерживаемого. Он способен добиться видимого согласия между членами команды, но на глубинном уровне могут остаться противоречия, которые в последствии приведут к краху предприятия. \nМенеджер такого типа нанимает таких же людей, какой он сам, что создает в организации видимость солидарности и лояльности.",
                qualities: [ "осторожность",
                             "приспособляемость" ],
                skills: [ "осведомленность",
                          "умение слушать",
                          "умение улавливать настроения людей" ]
            )
        case "----" :
            result = Result(
                shortInfo: "Мертвый пень",
                picture: "8",
                characteristic: "Руководитель данного типа — это идеальный подчиненный для героя-одиночки, бюрократа, поджигателя и горячего сторонника. Потому что никогда не жалуется на свою работу и обладает низкой сопротивляемостью к чужому мнению. \nОн безынициативен и его целью является сохранение стабильности своего маленького мирка. Поэтому мертвый пень не любит брать на себя новые проекты и рисковать.",
                qualities: [ "покладистость",
                             "дружелюбие",
                             "трудолюбие",
                             "пассивность" ],
                skills: [ "выживание в организации" ]
            )
        case "PA--" :
            result = Result(
                shortInfo: "Надсмоторщик",
                picture: "9",
                characteristic: "Надсмотрщик нацелен на производство результатов и контроль процессов, направленных на их достижение. Его не интересует творчество и люди, для него важно, что они делают и как. \nПодобный руководитель автократического типа воспринимает организацию механистически. Его планы и действия расписаны до мелочей.",
                qualities: [ "ответственность",
                             "целеустремленность",
                             "внимательность",
                             "методичность" ],
                skills: [ "управление ресурсами",
                          "тайм-менеджмент",
                          "внедрение процессов",
                          "управление процессами" ]
            )
        case "PA-I" :
            result = Result(
                shortInfo: "Милостивый государь",
                picture: "10",
                characteristic: "Милостивый государь успешно справляется с достижением краткосрочных результатов, поддержанием эффективных систем управления и контроля, а также со сплочением людей для реализации принятых решений. \nОднако ему не достает креативности и харизмы, поэтому он является всего лишь правителем, который умеет выслушать подчиненных и склонить их к работе.",
                qualities: [ "целеустремленность",
                             "методичность",
                             "энергичность",
                             "эмпатия" ],
                skills: [ "самоорганизация",
                          "управление ресурсами",
                          "управление процессами",
                          "сплочение команды" ]
            )
        case "-A-I" :
            result = Result(
                shortInfo: "Заботливый бюракрат",
                picture: "11",
                characteristic: "Заботливый бюрократ создает систему контроля, которая не вызывает недовольства его сотрудников. При этом он не терпит конфликтов, и его не интересуют результаты. \nПоначалу подчиненным такого менеджера все нравится, и создается впечатление, что компания эффективна. Однако со временем, становится понятно, что она находится в застое.",
                qualities: [ "внимательность",
                             "методичность",
                             "энергичность",
                             "эмпатия" ],
                skills: [ "составление регламентов",
                          "деловая переписка",
                          "управление процессами",
                          "сплочение команды" ]
            )
        case "P--I" :
            result = Result(
                shortInfo: "Тренер малой лиги",
                picture: "12",
                characteristic: "Тренер малой лиги отлично умеет формировать и сплочать команду, которую прекрасно координирует для достижения результатов. Его не интересуют внешние условия работы компании, и он не настаивает на соблюдении формальностей. Он поощряет и поддерживает тех, кто делает свое дело. \nТакой стиль приносит плоды только лишь в краткосрочном аспекте. Тренер малой лиги не умеет закреплять свои достижения, не разрабатывает стратегию и не выдвигает серьезных идей.",
                qualities: [ "целеустремленность",
                             "упорство",
                             "лидерство",
                             "эмпатия" ],
                skills: [ "формирование команды",
                          "сплочение команды",
                          "мотивация команды",
                          "управление ресурсами",
                          "самоорганизация" ]
            )
        case "P-E-" :
            result = Result(
                shortInfo: "Основоположник",
                picture: "13",
                characteristic: "Основоположник — отличный менеджер на ранних этапах развития компании. Но в долгосрочной перспективе он становится неэффективным, потому что для устойчивого развития компании требуются администрирование и интеграция. \nОбычно основоположник превращает компанию в театр одного актера, поскольку ему некогда делегировать полномочия или сплачивать людей.",
                qualities: [ "целеустремленность",
                             "упорство",
                             "креативность",
                             "интуиция" ],
                skills: [ "самоорганизация",
                          "управление ресурсами",
                          "генерация идей" ]
            )
        case "PAE-" :
            result = Result(
                shortInfo: "Изобретатель-одиночка",
                picture: "14",
                characteristic: "Изобретатель-одиночка отлично справляется с реализацией сложнейших проектов — от разработки идеи к построении системы управления и контроля и далее к результатам. \nОднако опасность такого руководителя в том, что он единолично занимается и производством результатов, и администрированием, и предпринимательством. Поэтому если изобретатель-одиночка покинет организацию, то ее ждет крах, так как не обеспечено выполнение I-функции — преемственности.",
                qualities: [ "целеустремленность",
                             "креативность",
                             "методичность" ],
                skills: [ "генерация идей",
                          "умение видеть картину",
                          "управление процессами",
                          "управление ресурсами" ]
            )
        case "--EI" :
            result = Result(
                shortInfo: "Демагог",
                picture: "15",
                characteristic: "Демагог старается уловить настроение коллектива, воодушевить его своей идеей и заручиться поддержкой. Но он никогда не думает о результатах. Поэтому из менеджеров подобного типа получаются отличные политики. \nДемагог получает удовольствие от одного того, что кто-то поддерживает его и готов воплощать в жизнь его идеи.",
                qualities: [ "обаятельность",
                             "креативность",
                             "осторожность",
                             "приспособляемость" ],
                skills: [ "генерация идей",
                          "умение улавливать настроения людей",
                          "краткосрочная мотивация команды" ]
            )
        case "-AEI" :
            result = Result(
                shortInfo: "Мнимый лидер",
                picture: "16",
                characteristic: "Мнимый лидер фонтанирует идеями, воодушевляет ими своих подчиненных и создает систему для их реализации. Но добиться желаемых результатов не получается. \nДело в том, что он не разбирается в том, что нужно делать для удовлетворения потребностей и нужд клиентов. Как следствие, мнимый лидер не может выполнять функцию производства результатов.",
                qualities: [ "целеустремленность",
                             "предприимчивость",
                             "энергичность",
                             "аккуратность" ],
                skills: [ "предприимчивость",
                          "энергичность",
                          "аккуратность" ]
            )
        case "-AE-":
            result = Result(
                shortInfo: "Зануда",
                picture: "17",
                characteristic: "Зануда стремится все контролировать и безразличен к мнению окружающих. Он постоянно генерирует идеи преобразований, но боится воплотить их в реальность. Поэтому компании не удается добиться каких бы то ни было результатов. \nПодавленный собственной несостоятельностью, зануда всегда мрачен и агрессивен.",
                qualities: [ "внимательность",
                             "креативность",
                             "скрупулезность" ],
                skills: [ "генерация идей",
                          "делегирование неудач",
                          "составление отчетов" ]
            )
        case "P-EI":
            result = Result(
                shortInfo: "Харизматичный гуру",
                picture: "18",
                characteristic: "Харизматический гуру может проанализировать текущую ситуацию в компании, предложить решение для достижения желаемого будущего и произвести нужный результат. \nПроблема гуру в том, что он приводит организацию к цели при помощи своей харизмы. Стоит ему покинуть свой пост руководителя, как она распадется из-за отсутствия системности.",
                qualities: [ "креативность",
                             "харизматичность",
                             "предприимчивость" ],
                skills: [ "генерация идей",
                          "умение видеть полную картину",
                          "сплочение команды",
                          "управление ресурсами" ]
            )
        case "-A--" :
            result = Result(
                shortInfo: "Бюрократ",
                picture: "default",
                characteristic: "Бюрократ стремится, чтобы все процессы компании были безупречны. Он добивается этого при помощи регламентации и отчетности, что способно задушить организацию в долгосрочной перспективе. \nМенеджер данного типа уделяет много времени мелочам, упуская при этом из вида общую картину. Бюрократ сосредоточен не на том, что стоит и делать и для чего, а на том, как это стоит делать.",
                qualities: [ "скрупулёзность",
                             "пунктуальность",
                             "аккуратность" ],
                skills: [ "составление регламентов",
                          "составление отчетов",
                          "деловая переписка" ]
            )
            
        default: result = Result(picture: "default")
            
        }

        return result
    }
}


/*
extension Result {
    
    
    static func getСharacter(number: Int, from string: String) -> String {
        let index = string.index(string.startIndex, offsetBy: number)
        return String(string[index])
    }
    
    
    static func customPael(key: String) -> Result {
        var pCharacteristic = ""
        var aCharacteristic = ""
        var eCharacteristic = ""
        var iCharacteristic = ""
        
        switch getСharacter(number: 0, from: key) {
        case "P":
            pCharacteristic = "Выполнение функции производства результатов находится на высоком уровне. Такой менеджер не просто понимает, что нужно делать. Он обладает достаточной целеустремленностью, чтобы воплотить идею в готовый продукт, который будет удовлетворять потребности клиентов."
        case "p":
            pCharacteristic = "Функция производства результатов развита ровно настолько, чтобы понимать, что нужно делать. Тем не менее, разработку продукта лучше делегировать ярко выраженному P-менеджеру, который знает рынок, потребности клиентов и технологии, способные их удовлетворить."
            
        case "-":
            pCharacteristic = "Менеджер, P-функция которого находится на таком низком уровне, не понимает рынка и потребностей клиентов. Он также не знает технологий, которые могут эти потребности удовлетворить. Как следствие, результативность компании в краткосрочном аспекте находится под угрозой."
        default: break
        }
        
        
        switch getСharacter(number: 1, from: key) {
        case "A":
            aCharacteristic = "Менеджер, выполняющий функцию администрирования на таком уровне, блестяще справляется с организацией рабочей среды, планированием, управлением и контролем ресурсов компании. Тем самым он подготавливает почву для производства результатов."
        case "a":
            aCharacteristic = "Функция администрирования развита на приемлемом уровне. Такой менеджер сможет осуществлять контроль производства результатов в настоящий момент. Однако создание системы бесперебойного функционирования предприятия лучше поручить настоящему Администратору."
        case "-":
            aCharacteristic = "Функция администрирования находится на низком уровне. Менеджер, который ею обладает, не может организовать процесс производства результатов. Он не обращает внимания на детали и не может систематизировать работу компании."
        default: break
        }
        
        //
        
        switch getСharacter(number: 2, from: key) {
        case "E":
            eCharacteristic = "Функция предпринимательства находится на высоком уровне. Такой менеджер обладает аналитическим мышлением, которое позволяет ему анализировать изменения окружающей среды. Его креативность помогает создать такое видение компании, которое сделает её успешной в долгосрочной перспективе, но работать над его достижением он начинает сразу же."
        case "e":
            eCharacteristic = "Функция предпринимательства развита на удовлетворительном уровне. Такой менеджер понимает важность стратегического планирования и действий, направленных на достижение долгосрочных целей. Тем не менее, разработку такого плана того, что делать сегодня, чтобы быть успешным завтра лучше поручить E-менеджеру."
        case "-":
            eCharacteristic = "Менеджер, выполняющий функцию предпринимательства на столь низком уровне, не обладает пониманием, что нужно делать сегодня, чтобы быть успешным завтра. Он не может руководить организацией в реалиях постоянно изменяющегося мира."
        default: break
        }
        
        
        switch getСharacter(number: 3, from: key) {
        case "I":
            iCharacteristic = "Менеджер, выполняющий функцию интеграции на таком уровне, блестяще справляется с созданием в компании атмосферы взаимоуважения и взаимодействия. Он направляет свое креативное мышление, чтобы сплотить людей с самыми разными мотивами и интересами для достижения общей цели."
        case "i":
            iCharacteristic = "Реализация I-функции находится на среднем уровне. Такой менеджер не справляется с ней в полной мере, поэтому ее следует делегировать ярко выраженному интегратору, который сможет организовать взаимодействие команды для достижения общей цели."
        case "-":
            iCharacteristic = "Функция интеграции находится в зачаточном состоянии. Следовательно, формирование, сплочение и мотивацию команды лучше поручить I-менеджеру. Он сможет создать в компании систему ценностей и норм поведения, которые направят усилия ее сотрудников на достижение общей цели."
        default: break
        }
        
        return Result(
            shortInfo: key,
            picture: "default",
            characteristic:
                pCharacteristic + "\n\n" + aCharacteristic + "\n\n" +
                eCharacteristic + "\n\n" + iCharacteristic
            //                        "\(pCharacteristic)\n\n\(aCharacteristic)\n\n\(eCharacteristic)\n\n\(iCharacteristic)")
        )
        
    }
    
    
}

 */


