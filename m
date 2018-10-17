From: rob.herring at linaro.org (Rob Herring)
Date: Wed, 17 Oct 2018 17:46:54 -0500
Subject: [RFC v1 22/31] kunit: mock: add the concept of spyable functions
In-Reply-To: <20181016235120.138227-23-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <20181016235120.138227-23-brendanhiggins@google.com>
Message-ID: <CABGGiswwS9NJJ__WVgimcFUiTy_76AtDOxeSbSuv-oz1xjjD5w@mail.gmail.com>

On Tue, Oct 16, 2018 at 6:54 PM Brendan Higgins
<brendanhiggins at google.com> wrote:
>
> Adds the concept of spying like in Mockito
> (http://static.javadoc.io/org.mockito/mockito-core/2.20.0/org/mockito/Mockito.html#spy-T-).
> This allows a function declaration to be labled as spyable which allows
> the function to be mocked *and* to allow the mock to invoke the original
> function definition.

We can already hook into arbitrary functions ftrace. Wouldn't
utilizing that simplify features like this and avoid having to touch
existing code for testing? Not sure what it would take to enable
ftrace on UML. It is at least partially compiler dependent.

Rob
