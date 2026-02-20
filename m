Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A028E344DA0
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 17:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771609617; cv=pass; b=qpWDBeUIT4sR4lBRFUn+PSClt6kZOT+vLZOjSJl72q6KEI9sx8UYXWUAmbfRbNTYjDLO6VcNoUqsjFKeoWOGZJlV6D5UpW1Sqihd3/HQQbvtM+zodjnVEcwI0EOSStssKSV+umqj9Kwxivfap+0vZ/QSTr1SjN9OQ4XI8aaivJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771609617; c=relaxed/simple;
	bh=L4LUtbq/AYJ1ibIci7EI6CXd6uhMJdMr550QxtjyFO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUR2UMqy5xTSgK0cuLIgQyxzwWJHUznA8DfiG8G3RpbAItdEBan6/sIA4RyWeoCmvitm+iGbq9sCHfAOQxSJqVJ0jefAA5PFaE6JB48G5gbaumbARVQurkFnWxwICxk3Z8cjvvSymblexy8gnwskiWadOB7OyM4Bps+QyrIhnpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UErns9a2; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UErns9a2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so1515e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 09:46:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771609614; cv=none;
        d=google.com; s=arc-20240605;
        b=DocHiCRvdkaD0Rw2HTxiVs2lQjbtbORI15Zq8ky0StydW+NPEypCD0UWzVoe60w5MH
         OqRZZbDgewewqZGkN6kRVlg2kYw+EIe+dW+bx9Qu4zWiVGh3maLr+B5T3Y0mw0HcujUl
         OjtCf5vgayTJ3VhyeKEHUsobgMOeg0gT8saeX2eZiHRJtQM+xNSL7ZJwPLNNGkaq+Wxy
         aErqMiUPI8oQdaWxR9OL6oaCh3lBeEeXM8V+kScs8/0ubIsuoLIfZj4LjXIUKfzTNq36
         WUAdZRR/6jtnPb6GG6/Ttu9iQVpocXaf5St3hSU3SWsnro0Aag242d0OiWuSPX+sh5oT
         rbww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TtrPaYzDg2FZ0DurUoi+gNF5T1+mzkiQf2zCfT8eyAI=;
        fh=Xyeg3JbdRzoakpliMYl0pQK4Y4naY1SPv/HmrrTAFZ0=;
        b=eP8Rb30Zu19vTMZh6ZKakyJxtlwNJe7GQw7VHAOtaIP6QEc5XxBPm4fe7dgLoTcR3T
         nArYRExmk3N+xUoRyGTffVRKcct3s43GjyWG9/ERMZ0iIJ9xbMEfg34jmKbfmXe+OvNy
         8gHFVCBVR+pkNNmNc8l1zttZqJgcm00xa9j+DwgYPZu/Hma4n/ZdHl1P7M41iBTxc5Fi
         yhHKAfz2Dm/JCJmGsoNb77ERivEsTZ+E3U8ECOUZDbX0XoTvgu1wGx/Wqasi+5BKseq+
         gPgEIxleku//2gl58umoGcCNrR/EWyIzCXg3rBzcPAGH1rmDvSDqMtq8YkrCLyT2/7BK
         P7qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771609614; x=1772214414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtrPaYzDg2FZ0DurUoi+gNF5T1+mzkiQf2zCfT8eyAI=;
        b=UErns9a2UGB3xcL2aFLGvcHe1hlRA35qOtTeH6UbuQQGshI4tTFmf9o43Ye8fLQQpA
         Qqsxcg5codC0LRPBqhLOb9cjg+yUV1HL4b7MSJNYu1U6X6ajiyxcH2H+HVsSBe2dDfDd
         idZjlryRA8Qv6V7THMiCvDnzAJH9iJPQFI7wKmPAcoG+r2J59s/lCb7LT95zFnF4g0Ya
         irJGnYmCuPcyS1IH3tAa3wKG3HKNYT2WKWXAnLZIhlTYYE/KxEM+/OXuxBBrXpRBzhi8
         ieOJIb37UHXE9vrwU58Fqjtkj3fQiFEqh+NsAYOaIVAd6brC/aEkxa1TvbgOmi4iUPTA
         xBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771609614; x=1772214414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TtrPaYzDg2FZ0DurUoi+gNF5T1+mzkiQf2zCfT8eyAI=;
        b=CLZQ35i7hHjRQazgZTNdH3lsxiNjloElBqeTkxVAyrqavxX+le5p3i+i8kGmBp4aBs
         JnePlrdIeGsPAqotgWrh4WOMa9wZmvlbdBSm+1Qdz+DG3UJoZm9WMdf/+2XjpMMPSyzC
         21/YEXUMh+4L4rqls/dssFgjkMRw4fbkrNw7/BcymHFPelfv2yR87BPDeEIFyH97hfWL
         SEraUcJPrbECZDp2hKQufgQnrc10ViLVXMn99ODWyQvPmfonrczBszCnJFn6APFVmpT9
         SrjABzpUPpS03ji87p0NfiGLH5U8Kg5o/YYwA4N/xDun9SDPtOQEWyQrGhAnDZryG/1y
         +t/g==
X-Forwarded-Encrypted: i=1; AJvYcCXyViqGJrRdUDdbJygqUThAqIP7ldjp4h9Qt7wM2yQD3QtzcBIlI4Hjkmj+dAygu5Xf8z4UZQ18RFbGk3pJowI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsC1u9uN/eFqdeuvT6pxX+x9hC8AWHN8avM4aCuNzQ9O1jUvP5
	8I/r9uw6geO/GsFHD5D34WmpKsJ8l9bnPK1IG+D8hBfwSeZububQMx6WHk3n6je5FfKFg9hSv+4
	bb47PFBPVaGpg6sHCxwhdv3kLpctn+N9kIHot4vKt
X-Gm-Gg: AZuq6aJRyf5of57KiHWg3J74zAhPZqfiduc0lFp8p6uiJPZrCRyEBMrhbj4t0hawg3s
	3KocJdM6r0MA5NhKYUy/9f74jE2Qx1rN1XVBQsxgXyfF0jgPeuMqAsZFym6S7jn6ArsqdrCP7g9
	ep/UriHeKIN3OWrv5r65xSa6+ogFBQFdB88CMK2ljJ+l4aNaaQZCW2a8AUtC80onwu0fSPZLcOW
	pXk6BeS/VTTArCzo6DCUTSiJrvHLCEtDmPLzl562OukPN2gDv5TEamTtgDN/xTNM2hqt6GDKrXY
	us30+FCvwA9pwtobiBfBN9B2A9dq7rQCxOvsZQ==
X-Received: by 2002:a05:600c:3b24:b0:477:2f6f:44db with SMTP id
 5b1f17b1804b1-483a441ed85mr992395e9.5.1771609613577; Fri, 20 Feb 2026
 09:46:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-4-tjmercier@google.com>
 <CAOQ4uxiPqUzBQAk8Tic7aFMsHtajEWENCTg+CQPMy5XtmS4kBQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxiPqUzBQAk8Tic7aFMsHtajEWENCTg+CQPMy5XtmS4kBQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 20 Feb 2026 09:46:41 -0800
X-Gm-Features: AaiRm51nxtCKSVmNbDDauz1vLZUs5KV1q654jLHNKJz17gEkMqiQHsF23IMGBCk
Message-ID: <CABdmKX3Pd8sJpzuQD0tfKCznOy3=cDoAOEnN-COQa59weUFrqw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED
To: Amir Goldstein <amir73il@gmail.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 9:44=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Fri, Feb 20, 2026 at 6:55=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > Add two new tests that verify inotify events are sent when memcg files
> > or directories are removed with rmdir.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Tejun Heo <tj@kernel.org>
> > Acked-by: Amir Goldstein <amir73il@gmail.com>
> > ---
> >  .../selftests/cgroup/test_memcontrol.c        | 112 ++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >
> > diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/t=
esting/selftests/cgroup/test_memcontrol.c
> > index 4e1647568c5b..57726bc82757 100644
> > --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> > +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> > @@ -10,6 +10,7 @@
> >  #include <sys/stat.h>
> >  #include <sys/types.h>
> >  #include <unistd.h>
> > +#include <sys/inotify.h>
> >  #include <sys/socket.h>
> >  #include <sys/wait.h>
> >  #include <arpa/inet.h>
> > @@ -1625,6 +1626,115 @@ static int test_memcg_oom_group_score_events(co=
nst char *root)
> >         return ret;
> >  }
> >
> > +static int read_event(int inotify_fd, int expected_event, int expected=
_wd)
> > +{
> > +       struct inotify_event event;
> > +       ssize_t len =3D 0;
> > +
> > +       len =3D read(inotify_fd, &event, sizeof(event));
> > +       if (len < (ssize_t)sizeof(event))
> > +               return -1;
> > +
> > +       if (event.mask !=3D expected_event || event.wd !=3D expected_wd=
) {
> > +               fprintf(stderr,
> > +                       "event does not match expected values: mask %d =
(expected %d) wd %d (expected %d)\n",
> > +                       event.mask, expected_event, event.wd, expected_=
wd);
> > +               return -1;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int test_memcg_inotify_delete_file(const char *root)
> > +{
> > +       int ret =3D KSFT_FAIL;
> > +       char *memcg =3D NULL;
> > +       int fd, wd;
> > +
> > +       memcg =3D cg_name(root, "memcg_test_0");
> > +
> > +       if (!memcg)
> > +               goto cleanup;
> > +
> > +       if (cg_create(memcg))
> > +               goto cleanup;
> > +
> > +       fd =3D inotify_init1(0);
> > +       if (fd =3D=3D -1)
> > +               goto cleanup;
> > +
> > +       wd =3D inotify_add_watch(fd, cg_control(memcg, "memory.events")=
, IN_DELETE_SELF);
> > +       if (wd =3D=3D -1)
> > +               goto cleanup;
> > +
> > +       if (cg_destroy(memcg))
> > +               goto cleanup;
> > +       free(memcg);
> > +       memcg =3D NULL;
> > +
> > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > +               goto cleanup;
> > +
> > +       if (read_event(fd, IN_IGNORED, wd))
> > +               goto cleanup;
> > +
> > +       ret =3D KSFT_PASS;
> > +
> > +cleanup:
> > +       if (fd >=3D 0)
> > +               close(fd);
> > +       if (memcg)
> > +               cg_destroy(memcg);
> > +       free(memcg);
> > +
> > +       return ret;
> > +}
> > +
> > +static int test_memcg_inotify_delete_dir(const char *root)
> > +{
> > +       int ret =3D KSFT_FAIL;
> > +       char *memcg =3D NULL;
> > +       int fd, wd;
> > +
> > +       memcg =3D cg_name(root, "memcg_test_0");
> > +
> > +       if (!memcg)
> > +               goto cleanup;
> > +
> > +       if (cg_create(memcg))
> > +               goto cleanup;
> > +
> > +       fd =3D inotify_init1(0);
> > +       if (fd =3D=3D -1)
> > +               goto cleanup;
> > +
> > +       wd =3D inotify_add_watch(fd, memcg, IN_DELETE_SELF);
> > +       if (wd =3D=3D -1)
> > +               goto cleanup;
> > +
> > +       if (cg_destroy(memcg))
> > +               goto cleanup;
> > +       free(memcg);
> > +       memcg =3D NULL;
> > +
> > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > +               goto cleanup;
>
>
> Does this test pass? I expect that listener would get event mask
> IN_DELETE_SELF | IN_ISDIR?

Yes, I tested on 4 different machines across different filesystems and
none of them set IN_ISDIR with IN_DELETE_SELF. The inotify docs say,
"may be set"... I wonder if that is wishful thinking?
