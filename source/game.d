module game;

import std.stdio;
import derelict.sdl2.sdl;
import derelict.sdl2.image;
import derelict.sdl2.mixer;
import derelict.sdl2.ttf;
import derelict.sdl2.net;

class Game {
  SDL_Window* m_mainWindow;
  bool m_isRunning = true;

  bool Init()
  {
    DerelictSDL2.load();
    DerelictSDL2Image.load();
    DerelictSDL2Mixer.load();
    DerelictSDL2ttf.load();
    DerelictSDL2Net.load();

    if (SDL_Init(SDL_INIT_EVERYTHING) < 0)
    {
      return false;
    }
    
    m_mainWindow = SDL_CreateWindow(
        "SDL2 Game Template in D",
        SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED,
        640,
        480,
        SDL_WINDOW_OPENGL);
    
    if (m_mainWindow == null)
    {
      return false;
    }

    return true;
  }

  void OnEvent(SDL_Event event)
  {
    if (event.type == SDL_QUIT)
    {
      m_isRunning = false;
    }
  }

  int Run()
  {
    Init();

    SDL_Event event;

    while (m_isRunning)
    {
      while (SDL_PollEvent(&event))
      {
        OnEvent(event);
      }

      Update();
      Draw();
    }

    return 0;
  }

  void Update()
  {

  }

  void Draw()
  {

  }


  ~this()
  {
    SDL_DestroyWindow(m_mainWindow);
    SDL_Quit();
    writeln("Game destructor complete");
  }
}
