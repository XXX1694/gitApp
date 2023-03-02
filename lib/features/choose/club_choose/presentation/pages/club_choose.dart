import 'package:fit_app/common/theme/colors.dart';
import 'package:fit_app/features/choose/club_choose/presentation/bloc/club_choose_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClubChooseBlock extends StatefulWidget {
  const ClubChooseBlock({super.key});

  @override
  State<ClubChooseBlock> createState() => _ClubChooseBlockState();
}

late ClubChooseBloc bloc;

class _ClubChooseBlockState extends State<ClubChooseBlock> {
  @override
  void initState() {
    bloc = BlocProvider.of<ClubChooseBloc>(context);
    bloc.add(GetClubs());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClubChooseBloc, ClubChooseState>(
      builder: (context, state) {
        if (state is ClubGot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Almaty',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: state.clubList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Stack(
                      children: [
                        Image.asset('assets/img/club_img.png'),
                        Container(
                          height: 148,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                Text(
                                  state.clubList[index].branch_name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  state.clubList[index].address,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    letterSpacing: 0,
                                    fontFamily: '123',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 148,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Spacer(),
                              Row(
                                children: [
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: GestureDetector(
                                      onTap: () async {
                                        Navigator.pushNamed(context,
                                            '/registration/subscription');
                                        bloc.add(
                                          SetClub(
                                            clubId: state.clubList[index].id,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 78,
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .choose,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is ClubsGetting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ClubGettingError) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
