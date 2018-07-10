From: pintu.ping@gmail.com (Pintu Kumar)
Date: Tue, 10 Jul 2018 22:46:20 +0530
Subject: [PATCH 2/3] selftests/android: initialize heap_type to avoid
 compiling warning
In-Reply-To: <1f24bf06-88cb-8d09-febf-02ff55ec263a@kernel.org>
References: <1530503634-32241-1-git-send-email-lizhijian@cn.fujitsu.com>
 <1530503634-32241-2-git-send-email-lizhijian@cn.fujitsu.com>
 <1530503634-32241-3-git-send-email-lizhijian@cn.fujitsu.com>
 <1f24bf06-88cb-8d09-febf-02ff55ec263a@kernel.org>
Message-ID:
 <CAOuPNLjrVtdALr6-3NcciSUW6-rTEv_6Ts2f0qzZ-niKzq0Mdg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180710171620.U9BPYgsWg0yAxyvIcZ6NE8M7f1xcaS90lDOMu-qMskc@z>

On Tue, Jul 10, 2018@8:20 PM Shuah Khan <shuah@kernel.org> wrote:
>
> Hi Li Zhijian,
>
> On 07/01/2018 09:53 PM, Li Zhijian wrote:
> > root at vm-lkp-nex04-8G-7 ~/linux-v4.18-rc2/tools/testing/selftests/android# make
> > make[1]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
> > make[1]: Entering directory '/root/linux-v4.18-rc2/tools/testing/selftests/android/ion'
> > gcc  -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../usr/include/ -Wall -O2 -g    ionapp_export.c ipcsocket.c ionutils.c   -o ionapp_export
> > ionapp_export.c: In function 'main':
> > ionapp_export.c:91:2: warning: 'heap_type' may be used uninitialized in
> > this function [-Wmaybe-uninitialized]
> >   printf("heap_type: %ld, heap_size: %ld\n", heap_type, heap_size);
> >   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > CC: Shuah Khan <shuah at kernel.org>
> > CC: Pintu Agarwal <pintu.ping at gmail.com>
> > Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>
> > ---
> >  tools/testing/selftests/android/ion/ionapp_export.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/tools/testing/selftests/android/ion/ionapp_export.c b/tools/testing/selftests/android/ion/ionapp_export.c
> > index a944e72..e3435c2 100644
> > --- a/tools/testing/selftests/android/ion/ionapp_export.c
> > +++ b/tools/testing/selftests/android/ion/ionapp_export.c
> > @@ -49,6 +49,7 @@ int main(int argc, char *argv[])
> >               return -1;
> >       }
> >
> > +     heap_type = -1UL;
>
> Initialize it to one of the valid types. ION_HEAP_TYPE_SYSTEM
> is one choice.
>
Yes, the test requires at least one of the heap type.
If you want, you can set it to the default value (0) at the
initialization time and not -1.

>
> >       heap_size = 0;
> >       flags = 0;
> >
May be we can set the heap_type as 0 here, to avoid those
uninitialized warnings.

> > @@ -82,6 +83,12 @@ int main(int argc, char *argv[])
> >               }
> >       }
> >
> > +     if (heap_type == -1UL) {
> > +             printf("heap_type is invalid\n");
> > +             print_usage(argc, argv);
> > +             exit(1);
> > +     }
>
> This check isn't necessary. The test requires two arguments,
> -i <heap id> and -s <size in bytes> and won't run without either
> one of them. heap_type is going to be ION_HEAP_TYPE_SYSTEM or
> ION_HEAP_TYPE_SYSTEM_CONTIG at this point.
>
> Interesting. Looks like this test doesn't cover all ion_heap_types.
>
Yes, all heap_types were not supported. As per Laura's request I removed it.
Other heap_types actually requires explicit declaration of reserved
memory or CMA region.

If you require other heap_type support then may be you can look into
my github version:
https://github.com/pintuk/LINUX/tree/master/android/ion


> thanks,
> -- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
