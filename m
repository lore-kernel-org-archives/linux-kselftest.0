Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E66033D512
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771610013; cv=pass; b=bMoxNOo/b6QIWQc6bQ/lRgPxijNI3HnWZlGaNzfHH8iaDhH4vHf8dwKTVeIy83Zgw9Ox0TwS5WoHCz3KVJQ4Od5IkKLU4c5iPG+EahT9kqB/cbFQxiMzO92Unm8sXzLCO7Fk5Tkj8jQ4FVJ+a9KGMetl4uzCWlfvWqHxCXhiOTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771610013; c=relaxed/simple;
	bh=6mvexzEJMyqKObc2kptqIRTofWhm/82iwmnJl33CcXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APqtH78SesLu62eGBxwtH3+qMVWefG7+ZQctu86F2m7tawNsvVlqXdcbzijIlStQRg7M3fu2yRDlfZP2y3vRVNYvMJ6o37t8atDvPuos0XueCY58tKcYKpTAMbuMd1HpbtRM0CxVw8j8Rg0Z9x0hLY9lg98FM2yIceN7jU+WIyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nXcuvZEX; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nXcuvZEX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48371d2f661so1475e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 09:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771610011; cv=none;
        d=google.com; s=arc-20240605;
        b=Ew3JkjAT8dEOw+i1uxSqHihs6NuPz/WVfvqBJdumgF5Pmd53d2fagMb+Q3iPO/Xjti
         XYMD7bvE0l4LjF7/E+3YTmNeOQxotowN0/ErT1BO5fE8V3r4M8lRRjSrVTu8wciIdmQ7
         zOccy7bgHhYx7SI4XKqHCtf1QQK/xn8ZuN1hU73QlM6unr969RYEtJl2/9Bjwm7H5H+g
         D2e21Btt2tW9dzoRDb37E9facOC/YAn/qWWBZ6BmP/+kHdnjkkLqsz0XKyIBGrchYIxL
         /0FEFPENY9AXc279oeLcCI/9DKFf4i355tIgjuu4t9TTtnk892xvR+cGYYCP9uuEQf07
         cDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zJXYxrDbswnHka6Gtr3ub6RBkdkqHTgw9iEO6yYMyQA=;
        fh=kAA4PKil7RVRjl7nMEjP5BE5aTMXzMTKeDObv3prRTA=;
        b=DUAb/Donvdb1iuutoxeN9rI7gKEqrSncjiU1UIhYJp7Lsb3TXQyqzyRIKTl+O4YKSf
         HTjDQwh1hGFpnXlD4aGIxaGunF59/yX7MXIjUZp52hilDMvN+S1rM3G1KPYBHJiJ9Mp9
         1BD5Bk+UWkHrNqkJsGa8RS1tr6xZiwYCTJ7hUawHvhdf/gGs6QVld/zP+pBKKISOUt2/
         PbBL5sO9+b4HCTEtFFmg41RNn9jCGk6yz4d9iCamd/oJ5xRwpmo866C8+IEg1+r81OMz
         HIvWhSx1MtJLxBDeTAIIR5E1C7HRGBuY4NMOKSXgeJ5EFsHe/32vQTOEZpmFDMFiXUVp
         QXFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771610011; x=1772214811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJXYxrDbswnHka6Gtr3ub6RBkdkqHTgw9iEO6yYMyQA=;
        b=nXcuvZEXEWY34qR4P1PnDNzmW5L7fA/ROo55L2FZL2edN8qWc0KP6Ep0buoG4gHwf9
         163C3S5der9Bg61gCQNOJb32WMulYxfd+3NILzcEVGM+I1viLf+8znNnq62SYuvt/3HA
         xXMDUyOIU/al8/vp6NEAaHLJoMy/5njiZLrpIWDi8Ps9wmQbguh0mtUMVgKnyOMze1cx
         Tv7iVAkbrPc0shb7IQqiVAG1TW9ksSQ6UxwpNABLEyGSQWE2qeHzQ1ne08eLbGWoSYmI
         nAoPgBqdVe2MqFUb4blxRhIZdNL0J2GQ6meBDkZHL7KcaUgIvH18g4s594hKunwC2AGz
         QZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771610011; x=1772214811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zJXYxrDbswnHka6Gtr3ub6RBkdkqHTgw9iEO6yYMyQA=;
        b=EkXChJgDTgQybySRtCUcgbdmEs3DX6Zeywev/9EdESJTtFhH5E5CaAGUgdidSD/DzA
         j5K7RW+MHAO3TMvbcNR4+5Lz7+c4gLFh3Y7PJ5c8QuVDoqCz1Y4tvgQ5Z23zFFDjilMR
         GgrmUixfebqw+yGVoqA0aIrVvCW3cfEAygHiA0mKmc3NeUal+ur5z/KUBohe9/ak4BFo
         zhegBqGRchDY/6NW5uh2IkFA3fDg/ygOPlwXszkaJGVhpYQ1z3D6fDkxq/st22cASKE5
         bviST2T5VqxXysK2vTewx7ZLiqgMd2+iyzhFXxBnbWLw77qf3BAWeNex35vo7YP0F+4m
         JkkA==
X-Forwarded-Encrypted: i=1; AJvYcCWsO6zG/L/ROPhZSY3CCcVBWTS70kOTXRLByPw+00dIfL5dQ6oW+29cJp4NFxR1IIfbhU6aCzHf3bKpa2patUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC7zbecnh4tZQ9s0WGjTchZQSQXs8HFdr2TBM8KEnhEmYx3eQc
	cpeT6oM+bVLnSuTemc7waYL5oq+dbU2YG8OPx6gYj+GBqatqaEXv3HwbqczXoJ3SfctwiePUlNT
	jPllUjuXYJUmJrsDyIpqrGf/+NMAp4fhUTkHHoVfo
X-Gm-Gg: AZuq6aLuJnnxMy/yM8znzObUtWVhp3ue0tV07Wdlo8bUxLac3U/aIhqSgJCINklIY49
	bBK2+DDd+GSG3G20DJFbyIIz93A0yWdWNTO4CmMgzgW85sFiCwXNbYd2qs/uN1uzgaK8HrDvh6W
	bVyRvAsGnPqVASVIS+ye2hcVBC9saBcrHGkyhR8pZFVNZsuNLysiXSJ/EsJ2bg/QvMLeTr2lU5a
	vGwKhAGlCODOXUxH20DYkoA6lwrFG3m/saG3rI8NEUqGaUmeI8qX3JHWSx7Q2zoZVTk57GxNIdF
	IAa7wwsxPMZNcfUFL/OggsUDwSNS2CQTMqzYXQ==
X-Received: by 2002:a05:600c:5916:b0:47d:7428:d00c with SMTP id
 5b1f17b1804b1-483a4426fcfmr611355e9.17.1771610010645; Fri, 20 Feb 2026
 09:53:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-4-tjmercier@google.com>
 <CAOQ4uxiPqUzBQAk8Tic7aFMsHtajEWENCTg+CQPMy5XtmS4kBQ@mail.gmail.com> <CABdmKX3Pd8sJpzuQD0tfKCznOy3=cDoAOEnN-COQa59weUFrqw@mail.gmail.com>
In-Reply-To: <CABdmKX3Pd8sJpzuQD0tfKCznOy3=cDoAOEnN-COQa59weUFrqw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 20 Feb 2026 09:53:18 -0800
X-Gm-Features: AaiRm523izsi0NGn8Sj7ziPjsd_zQLpE-spc-8PJpygVLLpqc8KPVf5Y_qsAi4o
Message-ID: <CABdmKX0H5Bx7qsk7JmOEnA2NZBHXd+QSYuwXHQGvaN6ppM38NA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED
To: Amir Goldstein <amir73il@gmail.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 9:46=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Fri, Feb 20, 2026 at 9:44=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Fri, Feb 20, 2026 at 6:55=E2=80=AFAM T.J. Mercier <tjmercier@google.=
com> wrote:
> > >
> > > Add two new tests that verify inotify events are sent when memcg file=
s
> > > or directories are removed with rmdir.
> > >
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > Acked-by: Tejun Heo <tj@kernel.org>
> > > Acked-by: Amir Goldstein <amir73il@gmail.com>
> > > ---
> > >  .../selftests/cgroup/test_memcontrol.c        | 112 ++++++++++++++++=
++
> > >  1 file changed, 112 insertions(+)
> > >
> > > diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools=
/testing/selftests/cgroup/test_memcontrol.c
> > > index 4e1647568c5b..57726bc82757 100644
> > > --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> > > +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> > > @@ -10,6 +10,7 @@
> > >  #include <sys/stat.h>
> > >  #include <sys/types.h>
> > >  #include <unistd.h>
> > > +#include <sys/inotify.h>
> > >  #include <sys/socket.h>
> > >  #include <sys/wait.h>
> > >  #include <arpa/inet.h>
> > > @@ -1625,6 +1626,115 @@ static int test_memcg_oom_group_score_events(=
const char *root)
> > >         return ret;
> > >  }
> > >
> > > +static int read_event(int inotify_fd, int expected_event, int expect=
ed_wd)
> > > +{
> > > +       struct inotify_event event;
> > > +       ssize_t len =3D 0;
> > > +
> > > +       len =3D read(inotify_fd, &event, sizeof(event));
> > > +       if (len < (ssize_t)sizeof(event))
> > > +               return -1;
> > > +
> > > +       if (event.mask !=3D expected_event || event.wd !=3D expected_=
wd) {
> > > +               fprintf(stderr,
> > > +                       "event does not match expected values: mask %=
d (expected %d) wd %d (expected %d)\n",
> > > +                       event.mask, expected_event, event.wd, expecte=
d_wd);
> > > +               return -1;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int test_memcg_inotify_delete_file(const char *root)
> > > +{
> > > +       int ret =3D KSFT_FAIL;
> > > +       char *memcg =3D NULL;
> > > +       int fd, wd;
> > > +
> > > +       memcg =3D cg_name(root, "memcg_test_0");
> > > +
> > > +       if (!memcg)
> > > +               goto cleanup;
> > > +
> > > +       if (cg_create(memcg))
> > > +               goto cleanup;
> > > +
> > > +       fd =3D inotify_init1(0);
> > > +       if (fd =3D=3D -1)
> > > +               goto cleanup;
> > > +
> > > +       wd =3D inotify_add_watch(fd, cg_control(memcg, "memory.events=
"), IN_DELETE_SELF);
> > > +       if (wd =3D=3D -1)
> > > +               goto cleanup;
> > > +
> > > +       if (cg_destroy(memcg))
> > > +               goto cleanup;
> > > +       free(memcg);
> > > +       memcg =3D NULL;
> > > +
> > > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > > +               goto cleanup;
> > > +
> > > +       if (read_event(fd, IN_IGNORED, wd))
> > > +               goto cleanup;
> > > +
> > > +       ret =3D KSFT_PASS;
> > > +
> > > +cleanup:
> > > +       if (fd >=3D 0)
> > > +               close(fd);
> > > +       if (memcg)
> > > +               cg_destroy(memcg);
> > > +       free(memcg);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static int test_memcg_inotify_delete_dir(const char *root)
> > > +{
> > > +       int ret =3D KSFT_FAIL;
> > > +       char *memcg =3D NULL;
> > > +       int fd, wd;
> > > +
> > > +       memcg =3D cg_name(root, "memcg_test_0");
> > > +
> > > +       if (!memcg)
> > > +               goto cleanup;
> > > +
> > > +       if (cg_create(memcg))
> > > +               goto cleanup;
> > > +
> > > +       fd =3D inotify_init1(0);
> > > +       if (fd =3D=3D -1)
> > > +               goto cleanup;
> > > +
> > > +       wd =3D inotify_add_watch(fd, memcg, IN_DELETE_SELF);
> > > +       if (wd =3D=3D -1)
> > > +               goto cleanup;
> > > +
> > > +       if (cg_destroy(memcg))
> > > +               goto cleanup;
> > > +       free(memcg);
> > > +       memcg =3D NULL;
> > > +
> > > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > > +               goto cleanup;
> >
> >
> > Does this test pass? I expect that listener would get event mask
> > IN_DELETE_SELF | IN_ISDIR?
>
> Yes, I tested on 4 different machines across different filesystems and
> none of them set IN_ISDIR with IN_DELETE_SELF. The inotify docs say,
> "may be set"... I wonder if that is wishful thinking?

Oh, very intentional:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/=
notify/inotify/inotify_fsnotify.c?h=3Dv6.19#n109
