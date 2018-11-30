From: mcgrof@kernel.org (Luis Chamberlain)
Date: Thu, 29 Nov 2018 19:44:25 -0800
Subject: [RFC v3 11/19] kunit: add Python libraries for handing KUnit
 config and kernel
In-Reply-To: <20181128193636.254378-12-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-12-brendanhiggins@google.com>
Message-ID: <20181130034425.GO18410@garbanzo.do-not-panic.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181130034425.o6ayYEHiXuAeeex8ubyXVH-YSiqOp1SV9E78k0b-C2s@z>

On Wed, Nov 28, 2018@11:36:28AM -0800, Brendan Higgins wrote:
> The ultimate goal is to create minimal isolated test binaries; in the
> meantime we are using UML to provide the infrastructure to run tests, so
> define an abstract way to configure and run tests that allow us to
> change the context in which tests are built without affecting the user.
> This also makes pretty and dynamic error reporting, and a lot of other
> nice features easier.
> 
> kunit_config.py:
>   - parse .config and Kconfig files.
>
> 
> kunit_kernel.py: provides helper functions to:
>   - configure the kernel using kunitconfig.

We get the tools to run the config stuff, build, etc, but not a top
level 'make kunitconfig' or whatever. We have things like 'make
kvmconfig' and 'make xenconfig', I think it would be reasonable to
add similar for this.

  Luis
