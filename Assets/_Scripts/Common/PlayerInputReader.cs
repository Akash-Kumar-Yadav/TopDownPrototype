using System;
using UnityEngine;
using UnityEngine.InputSystem;

namespace TopDownPrototype.Common
{
    [CreateAssetMenu(fileName = "ScriptableObject/PlayerInput", menuName = "PlayerInputSO", order = 0)]
    public class PlayerInputReader : ScriptableObject, DefaultInputActions.IPlayerActions
    {
        public event Action<Vector2> OnMoveEvent;
        public event Action<Vector2> OnLookEvent;
        public event Action OnFireEvent;
        
        private DefaultInputActions _defaultInputActions;
        private void OnEnable()
        {
            _defaultInputActions = new DefaultInputActions(); 
            _defaultInputActions.Player.SetCallbacks(this);     
            _defaultInputActions.Player.Enable();
        }

        private void OnDisable()
        {
            _defaultInputActions.Player.SetCallbacks(null);
            _defaultInputActions.Player.Disable();
        }

        public void OnMove(InputAction.CallbackContext context)
        {
            OnMoveEvent?.Invoke(context.ReadValue<Vector2>());
        }

        public void OnLook(InputAction.CallbackContext context)
        {
            OnLookEvent?.Invoke(context.ReadValue<Vector2>());
        }

        public void OnFire(InputAction.CallbackContext context)
        {
            if(context.performed)
                OnFireEvent?.Invoke();
        }
    }
}