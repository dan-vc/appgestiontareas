<x-guest-layout>
    <div class="bg-secondary p-6 rounded-lg shadow-lg max-w-xl m-auto">
        <div class="mb-4 text-sm">
            ¿Olvidaste tu contraseña? No hay problema. Simplemente indícanos tu dirección de correo electrónico y te
            enviaremos un enlace para restablecer tu contraseña.
        </div>

        <!-- Session Status -->
        <x-auth-session-status class="mb-4" :status="session('status')" />

        <form method="POST" action="{{ route('password.email') }}">
            @csrf

            <!-- Email Address -->
            <div>
                <x-input-label for="email" :value="__('Email')" />
                <x-text-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')"
                    required autofocus />
                <x-input-error :messages="$errors->get('email')" class="mt-2" />
            </div>

            <div class="flex items-center justify-end mt-4">
                <x-secondary-button class="mr-4" onclick="window.location='{{ route('login') }}'">
                    Cancelar
                </x-secondary-button>
                <x-primary-button>
                    Enviar enlace para restablecer la contraseña
                </x-primary-button>
            </div>
        </form>
    </div>
</x-guest-layout>
