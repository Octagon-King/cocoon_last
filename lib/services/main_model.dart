// import 'package:cocoon/services/recording_service.dart';
import 'package:scoped_model/scoped_model.dart';

import './newsletter_service.dart';
import './ibiza_service.dart';
import './event_service.dart';
import './carausel_image_service.dart';
import './grid_image_service.dart';
import 'recording_service.dart';

class MainModel extends Model
    with
        NewsletterService,
        IbizaService,
        EventService,
        CarauselImageService,
        GridImageService,
        RecordingService {}
