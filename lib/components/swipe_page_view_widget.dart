import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'swipe_page_view_model.dart';
export 'swipe_page_view_model.dart';

class SwipePageViewWidget extends StatefulWidget {
  const SwipePageViewWidget({
    super.key,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  });

  final int? parameter2;
  final List<String>? parameter3;
  final List<String>? parameter4;

  @override
  State<SwipePageViewWidget> createState() => _SwipePageViewWidgetState();
}

class _SwipePageViewWidgetState extends State<SwipePageViewWidget> {
  late SwipePageViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipePageViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final photos = widget.parameter4?.toList() ?? [];

        return Container(
          width: double.infinity,
          height: 240.0,
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _model.pageViewController ??=
                PageController(initialPage: max(0, min(0, photos.length - 1))),
            scrollDirection: Axis.horizontal,
            itemCount: photos.length,
            itemBuilder: (context, photosIndex) {
              final photosItem = photos[photosIndex];
              return Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                child: Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'SWIPE_VIEW_Stack_u9lg73fv_ON_TAP');
                            logFirebaseEvent('Stack_page_view');
                            await _model.pageViewController?.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.42,
                            child: Stack(
                              children: [],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'SWIPE_VIEW_Stack_02s119kz_ON_TAP');
                            if (_model.pageViewCurrentIndex ==
                                widget.parameter2) {
                              logFirebaseEvent('Stack_page_view');
                              await _model.pageViewController?.animateToPage(
                                0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            } else {
                              logFirebaseEvent('Stack_page_view');
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.42,
                            child: Stack(
                              children: [],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: photosItem,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
