using System;
using Unity.Cinemachine;
using UnityEngine;

namespace _Scripts.Common
{
    [RequireComponent(typeof(Rigidbody))]
    public class PlayerLocomotion : MonoBehaviour
    {
        [SerializeField] private float _moveSpeed;
        [SerializeField] private CinemachineFollow _camera;
        private Rigidbody _rb;
        private Vector3 _moveDirection;
        private Vector3 _inputDirection;

        private void Awake()
        {
            _rb = GetComponent<Rigidbody>(); 
        }
        
        public void Move(Vector2 moveVector) => _inputDirection = new Vector3(moveVector.x, 0, moveVector.y);

        private void Update()
        {
            HandleMoveInput();
        }

        private void HandleMoveInput()
        {
            var moveVector = _inputDirection;
            if (moveVector.sqrMagnitude > .1f)
            {
                Vector3 camForward = _camera.transform.forward;
                Vector3 camRight = _camera.transform.right;
                
                camForward.y = 0;
                camRight.y = 0;
                camForward.Normalize();
                camRight.Normalize();
                
                Vector3 moveDirection = camForward * moveVector.z + camRight * moveVector.x;
                _moveDirection = moveDirection;
            }
            else
            {
                _moveDirection = Vector3.zero;
            }
            transform.position += _moveDirection * (_moveSpeed * Time.deltaTime);
        }
        
    }
}