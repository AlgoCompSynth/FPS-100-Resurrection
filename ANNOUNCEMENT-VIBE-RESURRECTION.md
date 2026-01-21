# Announcement - Vibe Resurrection

I've finally succumbed to the "vibe coding" hype! One of the gurus
recommends taking on an ambitious project, so I am moving ahead with
attempting to resurrect the FPS-100 software with the assistance of
the `GLM-4.7-Flash` model running on my five-year-old NVIDIA RTX
3090 GPU. I'm doing this in a branch called `vibe-resurrection` in case
you want to follow along.

At the moment, I'll be doing everything I can in a container using
[Bluefin](https://projectbluefin.io) as the host. Given that the model is
large enough to use a GPU with 24 GB of dedicated RAM, I'm not
going to worry about portability too much.

The first task I want to tackle is getting some of the FPS tools working
on Linux if at all possible. If I can get the assembler, simulator and
debugger working that will give the hardware engineers a lot of help
with troubleshooting. The backup plan - using PiDP 11 - requires me
learning how to use RSX-11M and how to shuffle data in and out of it
from other systems.

So - watch this space! I'll probably be posting updates to LinkedIn,
since that's my connection point to a few other FPS alumni.
