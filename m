From: robh at kernel.org (Rob Herring)
Date: Wed, 28 Nov 2018 15:26:03 -0600
Subject: [RFC v3 06/19] arch: um: enable running kunit from User Mode Linux
In-Reply-To: <20181128193636.254378-7-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-7-brendanhiggins@google.com>
Message-ID: <CAL_JsqJLNSg-38hej8LV+Oh-YXBM2hRGomie3b_psa9LvzoRYg@mail.gmail.com>

On Wed, Nov 28, 2018 at 1:37 PM Brendan Higgins
<brendanhiggins at google.com> wrote:
>
> Make minimum number of changes outside of the KUnit directories for
> KUnit to build and run using UML.

There's nothing in this patch limiting this to UML. Only patch 1 does
that and I would remove that depends. I'd guess most folks will want
to run under something other than UML. DRM for instance (though the
virtual KMS stuff may work in UML?).

Plus you want to make sure this all builds with allmodconfig for x86
(or ARM) because those get the most (and quickest) compile coverage.

Rob
