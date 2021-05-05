import { trigger, transition, style, query, group, animateChild, animate, keyframes } from '@angular/animations'


// export const slideInAnimation =
//   trigger('routeAnimations', [
//     transition('HomePage <=> LoginPage', [
//       style({ position: 'relative' }),
//       query(':enter, :leave', [
//         style({
//           position: 'relative',
//           top: 0,
//           left: 0,
//           width: '100%'
//         })
//       ]),
//       query(':enter', [
//         style({ left: '-100%' })
//       ]),
//       query(':leave', animateChild()),
//       group([
//         query(':leave', [
//           animate('300ms ease-out', style({ left: '100%' }))
//         ]),
//         query(':enter', [
//           animate('300ms ease-out', style({ left: '0%' }))
//         ])
//       ]),
//       query(':enter', animateChild()),
//     ]),
//     transition('FilterPage <=> *', [
//       style({ position: 'relative' }),
//       query(':enter, :leave', [
//         style({
//           position: 'relative',
//           top: 0,
//           left: 0,
//           width: '100%'
//         })
//       ]),
//       query(':enter', [
//         style({ right: '-100%' })
//       ]),
//       query(':leave', animateChild()),
//       group([
//         query(':leave', [
//           animate('200ms ease-out', style({ right: '100%' }))
//         ]),
//         query(':enter', [
//           animate('300ms ease-out', style({ right: '0%' }))
//         ])
//       ]),
//       query(':enter', animateChild()),
//     ])
//   ]);


export const slider =
  trigger('routeAnimations', [
    transition('HomePage => LoginPage', 
    
  [
      query(':enter, :leave', [
      style({
        position: 'relative',
        top: 0,
        right: 100,
        width: '100%'
      })
    ], { optional: true }),
    query(':enter', [
      style({ right: '-0%'})
    ]),
    group([
      query(':leave', [
        animate('800ms ease', style({ right: '0%'}))
      ], { optional: true }),
      query(':enter', [
        animate('800ms ease', style({ right: '100%'}))
      ])
    ]),
  ]
    ),
    transition('LoginPage => HomePage', 
    
  [
      query(':enter, :leave', [
      style({
        position: 'relative',
        top: 0,
        left: 0,
        width: '100%'
      })
    ], { optional: true }),
    query(':enter', [
      style({ right: '-100%'})
    ]),
    group([
      query(':leave', [
        animate('800ms ease', style({ left: '100%'}))
      ], { optional: true }),
      query(':enter', [
        animate('800ms ease', style({ left: '0%'}))
      ])
    ]),
  ]
    ),
  //   transition('* => isRight', 
    
  //   [
  //     query(':enter, :leave', [
  //     style({
  //       position: 'absolute',
  //       top: 0,
  //       right: 0,
  //       width: '100%'
  //     })
  //   ], { optional: true }),
  //   query(':enter', [
  //     style({ right: '-100%'})
  //   ]),
  //   group([
  //     query(':leave', [
  //       animate('600ms ease', style({ right: '100%'}))
  //     ], { optional: true }),
  //     query(':enter', [
  //       animate('600ms ease', style({ right: '0%'}))
  //     ])
  //   ]),
  // ]
  //   ),
  //   transition('isRight => *', [
  //     query(':enter, :leave', [
  //     style({
  //       position: 'absolute',
  //       top: 0,
  //       left: 0,
  //       width: '100%'
  //     })
  //   ], { optional: true }),
  //   query(':enter', [
  //     style({ left: '-100%'})
  //   ]),
  //   group([
  //     query(':leave', [
  //       animate('600ms ease', style({ left: '100%'}))
  //     ], { optional: true }),
  //     query(':enter', [
  //       animate('600ms ease', style({ left: '0%'}))
  //     ])
  //   ]),
  // ] ),
  //   transition('isLeft => *', [
  //     query(':enter, :leave', [
  //     style({
  //       position: 'absolute',
  //       top: 0,
  //       right: 0,
  //       width: '100%'
  //     })
  //   ], { optional: true }),
  //   query(':enter', [
  //     style({ right: '-100%'})
  //   ]),
  //   group([
  //     query(':leave', [
  //       animate('600ms ease', style({ right: '100%'}))
  //     ], { optional: true }),
  //     query(':enter', [
  //       animate('600ms ease', style({ right: '0%'}))
  //     ])
  //   ]),
  // ] )
  ]);

