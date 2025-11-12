using System;
using Unity.VisualScripting;
using UnityEngine;

namespace TopDownPrototype.Common
{
    public class PlayerAnimation : MonoBehaviour
    {
        private static readonly int SpeedX = Animator.StringToHash("SpeedX");
        private static readonly int SpeedY = Animator.StringToHash("SpeedY");
        [SerializeField] private Animator _animator;
        [SerializeField] private PlayerInputReader _inputReader;

        private void OnEnable()
        {
            _inputReader.OnMoveEvent += OnMove;
        }
        private void OnDisable()
        {
            _inputReader.OnMoveEvent -= OnMove;
        }
        
        private void OnMove(Vector2 obj)
        {
            _animator.SetFloat(SpeedX, obj.x);
            _animator.SetFloat(SpeedY, obj.y);
            // if (obj.sqrMagnitude > .1f)
            //     _animator.SetFloat(SpeedX, obj.sqrMagnitude);
        }
    }
}