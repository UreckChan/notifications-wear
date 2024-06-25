import 'package:weartest/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SizedBox.expand(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter"),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().increment(),
              child: const Icon(Icons.add)),
            const SizedBox(height: 5,),
            const CounterText(),
            const SizedBox(height: 5,),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().decrement(), 
              child: const Icon(Icons.remove)),
                        ElevatedButton(
              onPressed: () => context.read<CounterCubit>().restart(), 
              child: const Text("Reiniciar")),  
          ],
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displayMedium);
  }
}
