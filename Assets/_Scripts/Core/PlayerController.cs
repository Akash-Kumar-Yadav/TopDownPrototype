using System;
using _Scripts.Common;
using TopDownPrototype.Common;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.InputSystem;

namespace TopDownPrototype.Core
{
    public class PlayerController : MonoBehaviour
    {
        [SerializeField] private PlayerInputReader _inputReader;
        [SerializeField] private PlayerLocomotion _playerLocomotion;
        [SerializeField] private float _rotationSpeed = 10f;
        
        private Camera _camera;
        private Vector2 _moveDir;

        private void Awake()
        {
            _camera = Camera.main; 
        }

        private void OnEnable()
        {
            _inputReader.OnMoveEvent += OnMove;
            _inputReader.OnLookEvent += OnLook;
        }

        private void Update()
        {
            RotatePlayer(); 
        }

        private void OnDisable()
        {
            _inputReader.OnMoveEvent -= OnMove;
            _inputReader.OnLookEvent -= OnLook;
        }
        private void OnMove(Vector2 obj)
        {
            _playerLocomotion.Move(obj);
            _moveDir = obj;
        }
        private void OnLook(Vector2 obj)
        {
            // RotatePlayer();
        }

        private void RotatePlayer()
        {
            Ray ray = _camera.ScreenPointToRay(Mouse.current.position.ReadValue());
            Plane plane = new Plane(Vector3.up, Vector3.zero);
            if (plane.Raycast(ray, out float enter))
            {
                Vector3 hitpoint = ray.GetPoint(enter);
                Vector3 direction = (hitpoint - transform.position).normalized;
                if (direction.sqrMagnitude > .01f)
                {
                    Quaternion newRotation = Quaternion.LookRotation(direction);
                    transform.rotation = Quaternion.Slerp(transform.rotation, newRotation, _rotationSpeed * Time.deltaTime);
                }
            }
            
        }
    }
}