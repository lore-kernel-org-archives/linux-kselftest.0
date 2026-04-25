Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01E3399001
	for <linux-kselftest@vger.kernel.org>; Sat, 25 Apr 2026 23:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777160935; cv=pass; b=uWaQ/TpvZYGJk7hkRFT+8uFBUH2W43H1JMBct6k1QJsM0jtQ4rxauawbkaGaqCsZE0QSBLv/k0+rGjR0zRBZrUCol3tslnlrSUyPES7NGpcoOeeACNhgpxTpwlucEkignG6qK73zz3Asc5V0LDS4aDnXrk7iS7n+NqUB01Sjw9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777160935; c=relaxed/simple;
	bh=zfdOoMHWacv8+vYWJPb9+BnHM07/V+RorqM72cpSFJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=on1nzam3ibjvVo/yeObxng/pi6sQDfRgzZ4746yOyBZO/1akhQSUB4zEBtTULFLTnudZcrgbUfZBmAmHgmqz6Ts0bm47adWhXgkQg2a6i7stm7dCeKLz/sDShVwPawd7LK9poHztnBTDftjTbiMtkXdpRQnA674tBsPGCzISTRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jCzcJ/O6; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jCzcJ/O6"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50e61648f10so4874511cf.1
        for <linux-kselftest@vger.kernel.org>; Sat, 25 Apr 2026 16:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777160932; cv=none;
        d=google.com; s=arc-20240605;
        b=K+dIGKzCKC/gjUmuewuJe9AX/hgdXVK7hVHdFN1M7UyEDrrw1SoT2M2QK6fOa2oNnQ
         4UEU28JSNfeqmBsbcRBXKl8dlDZ2c9tYq020KJeCvf2NN1LHqIWzVtJ9xt4lWCNPZh3E
         gif3LMYuPVq8zxR6m5WM4f+NkYLGRULTtKshOb2eTgaQ0mGJWEcf9szf35nVni1ESl1q
         RcW0NR4X0ON7kMDSwTIDuR/CcHhCoB/DWbNXillKoJm15/IwEx1Ccu5CHR1VfV6OqP9i
         eHBPYV3G4FDAwZe/MtTOtIKsJtXQ0zToBkFUzppkrndBZ59WSvtooE+0CUNIZU1YXzro
         xkng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZydx8l84GIjMRw3J0wCqIG05nmQhWK3VDWewjGvVJo=;
        fh=tQ0Skzz8rCU+3cRMWq+lHzw+Pg54ksTVfKOgn/VRXvQ=;
        b=a6ng6QBoET6V6Z/GO50utAXCEDd6lE/FWUkbMnGQWGzde6lZqPa1j5OIMcgwABfaqb
         1ETiRXNWSnZynGXwHI+SbVvE56fgyMJBSIuCeo94umiUcep890ayKGZM2gjluGnR1I2O
         4V+g0SmE9Q0yL4gbL/jS7kYuqZcdnBVQM0CVavY7ALmAvyhTl3wR6FuHz8ZAxuqpeQ+u
         djjUFRwDvsQ8AjbKLYiI7yQC2UOg9Qb3Aq5QO0oqeE4ujBLu8eesYzscroq+JroaFeou
         u1s7dGQLcXfTnhtzflauIb6ATfI/Cg3sIUhPGSWmB1gbWWzPfcn+9ZhBGkvA7wMA5mqv
         YVLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777160932; x=1777765732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZydx8l84GIjMRw3J0wCqIG05nmQhWK3VDWewjGvVJo=;
        b=jCzcJ/O6w3n3JvWvX1mNWFkze1zO3XRqZjGr20sV1KJMVwn2PUiJvLVn/Z4H/Caftu
         D9/Gav62AT46IbgfJFL0pUAdR70SU1nzP/2ouypHqV+qE+lJynPKznVl7f68/KXO7Q6/
         Ci3w1v/VTg6UA7lO6EolsdyHilF7kMI9DKBX0Kodw1fU8ui+IduX5Txsj+eRUgAoelRp
         tasWYmJ1orBLW7G4i5RVANjpryrmRGR2lVSeKizS+MbH1SI/A8hJDNYg618/uvTfxZah
         8paVBs9+4l/P60g6Ru/EnyXbX1YgK0HSs/juOyPf8vVtaoAgf4mfhxNkQ12oSgWjuOpE
         zTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777160932; x=1777765732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bZydx8l84GIjMRw3J0wCqIG05nmQhWK3VDWewjGvVJo=;
        b=VSWKtof3VvT0COvqNiGPm+hDjTkRr26Tm8oc5p97kwqgQo8FJIXl8ezTg8rUt905u3
         mutdl+DYZLdwbFR+xKvzVC0fdPkcvS8WmnFBBD8wpQ3t4QbPycXT7SN5SlTBRaAiP1xg
         lQE31bW6BU7lw0pLMq1sl/MnOOX97JPgB5Tck3IZayjS2jVVK5/kyFhCQlWG1kcuQyso
         y61iZYlHMhhLL45RbuzHUKT+/i8sxhmr81/kEqhjiXeaK6JXTIy7MIhRGpooEgBa5tuX
         hkEm4OAFfiM0+hReoa39ahFNCav9nS7hBOK+BXNQT96edX7cTcY4JEQWigk8tmELB34/
         CYtg==
X-Forwarded-Encrypted: i=1; AFNElJ+OMjGNlSa3GL84mY7ekM+aEuxptXi/Cxu03+ifiAEDl2xFOSUD/7Qm7GNQ1+VSBes5eM8BmmAUsQx/ga2eZkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiz6R6QPB7Bc9gcsYo/nklXRUS/mWOH+Sz2/8mhV7kWbRFM3X2
	V0sWdFHYVSuQ8gtsW8bJnmQWlD4QLbfS6dneIrOGBpLapf5IfYkSrFQK5X67Oj5T153Z99RN5Pr
	2bM2VjjF7evrCJ0Ck3S2qDiEWh0i7Mu4p8kXrZY2T
X-Gm-Gg: AeBDiesdbqPs1SyWYhnBqIaBudb82SL5bLmxfS140XvqB5rPWmlNFiu5eZI0rlK3H8l
	ZoIYMPuIOAU3kcMcQ5iNwWcptSSCHLP9ax+CZ/Argi6HcrN5nZyj51lZYAFn47os2GEYx0kVhiT
	mDYETG74tAP5q08UVgWN8kOsR1jSezQ0F/IG9VoZC3URv0/oMjxoWO0jBUq2PWZp0f+jz6/x6CF
	/q6IrYjKlIyArtV190EaQpToWysgvYC5DsCdwVhe40s3uYrsNPVx5WvfCkW8F9+cNchc5UOHR1y
	8t33PTcq8is4J1ksFpAmA9Wb5qc=
X-Received: by 2002:a05:622a:2599:b0:50e:41f3:6467 with SMTP id
 d75a77b69052e-50e42a9a87cmr75265781cf.12.1777160932012; Sat, 25 Apr 2026
 16:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424070234.190145-1-surenb@google.com> <20260424070234.190145-4-surenb@google.com>
 <qxxhshfoe5tph4z324fzl74r532bxdrdvll2xvhaeken6bsdwb@q2wk2nbvxr3p> <CAJuCfpE5C9UpkrAEvm6amw7=JYRoXeiSJuPFJnb+LRrVwn4ntA@mail.gmail.com>
In-Reply-To: <CAJuCfpE5C9UpkrAEvm6amw7=JYRoXeiSJuPFJnb+LRrVwn4ntA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 25 Apr 2026 16:48:41 -0700
X-Gm-Features: AVHnY4KZBbekKCuP917ssJD9scQNvVAIkA6V3UQh7_KRcYvTGhJaQbkMQyDyQ6c
Message-ID: <CAJuCfpG6wZe9N2XREe0Aef=aH5LRGriZYaQeCsqPqoKqMEXN6Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] selftests/proc: add /proc/pid/smaps tearing tests
To: "Liam R. Howlett" <liam@infradead.org>
Cc: akpm@linux-foundation.org, ljs@kernel.org, vbabka@kernel.org, 
	david@redhat.com, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, shuah@kernel.org, hsukrut3@gmail.com, 
	richard.weiyang@gmail.com, reddybalavignesh9979@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 12:59=E2=80=AFPM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Fri, Apr 24, 2026 at 11:23=E2=80=AFAM Liam R. Howlett <liam@infradead.=
org> wrote:
> >
> > On 26/04/24 12:02AM, Suren Baghdasaryan wrote:
> > > Add MAPS_FILE environment variable to select whether the tests to be =
run
> > > for /proc/pid/maps or /proc/pid/smaps. Add support for testing smaps =
file
> > > by reusing the same logic as with maps file but skipping all the data
> > > except for the VMA addresses, which are the only part relevant for th=
e
> > > tearing tests. Skip PROCMAP_QUERY parts of the tests because smaps do=
es
> > > not implement that ioctl.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >
> > One comment question, otherwise..
> >
> > Reviewed-by: Liam R. Howlett <liam@infradead.org>
> >
> > > ---
> > >  tools/testing/selftests/proc/proc-maps-race.c | 176 +++++++++++++---=
--
> > >  1 file changed, 132 insertions(+), 44 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/proc/proc-maps-race.c b/tools/te=
sting/selftests/proc/proc-maps-race.c
> > > index c5031b0593b7..b677bc23cab9 100644
> > > --- a/tools/testing/selftests/proc/proc-maps-race.c
> > > +++ b/tools/testing/selftests/proc/proc-maps-race.c
> > > @@ -17,8 +17,8 @@
> > >   */
> > >  /*
> > >   * Fork a child that concurrently modifies address space while the m=
ain
> > > - * process is reading /proc/$PID/maps and verifying the results. Add=
ress
> > > - * space modifications include:
> > > + * process is reading /proc/$PID/maps and /proc/$PID/smaps, verifyin=
g the
> >                                          ^^^ and? Should this be or?  I=
t
> >                                          doesn't match your commit
> >                                          message.
>
> Quite right. I'll fix it. Need to post a new version anyway since
> Sashiko found a couple of issues.

Actually, I realized that I can use FIXTURE_VARIANT to easily run
tests for both smaps and maps in the same run. I think that's a better
option.
v2 has a number of fixups for issues flagged by Sashiko but they are
quite straight-forward, so I think I can keep your Reviewed-by.
Will post an update shortly after I verify that Sashiko is fine with it.

>
> >
> >
> > > + * results. Address space modifications include:
> > >   *     VMA splitting and merging
> > >   *
> > >   */
> > > @@ -73,6 +73,11 @@ enum test_state {
> > >       TEST_DONE,
> > >  };
> > >
> > > +enum maps_file {
> > > +     MAPS,
> > > +     SMAPS,
> > > +};
> > > +
> > >  struct vma_modifier_info;
> > >
> > >  FIXTURE(proc_maps_race)
> > > @@ -83,6 +88,7 @@ FIXTURE(proc_maps_race)
> > >       struct line_content last_line;
> > >       struct line_content first_line;
> > >       unsigned long duration_sec;
> > > +     enum maps_file maps_file;
> > >       int shared_mem_size;
> > >       int skip_pages;
> > >       int page_size;
> > > @@ -199,6 +205,57 @@ static void copy_last_line(struct page_content *=
page, char *last_line)
> > >       last_line[end - pos] =3D '\0';
> > >  }
> > >
> > > +static bool copy_first_entry(struct page_content *page, char *first_=
line)
> > > +{
> > > +     const char *start_pos =3D page->data;
> > > +
> > > +     while (start_pos < page->data + page->size) {
> > > +             unsigned long start_addr;
> > > +             unsigned long end_addr;
> > > +             char *end_pos;
> > > +
> > > +             end_pos =3D strchr(start_pos, '\n');
> > > +             if (!end_pos)
> > > +                     break;
> > > +
> > > +             if (sscanf(start_pos, "%lx-%lx", &start_addr, &end_addr=
) =3D=3D 2) {
> > > +                     strncpy(first_line, start_pos, end_pos - start_=
pos);
> > > +                     first_line[end_pos - start_pos] =3D '\0';
> > > +                     return true;
> > > +             }
> > > +
> > > +             start_pos =3D end_pos + 1;
> > > +     }
> > > +
> > > +     return false;
> > > +}
> > > +
> > > +static bool copy_last_entry(struct page_content *page, char *last_li=
ne)
> > > +{
> > > +     const char *end_pos =3D page->data + page->size - 1;
> > > +     const char *start_pos;
> > > +
> > > +     while (end_pos > page->data) {
> > > +             unsigned long start_addr;
> > > +             unsigned long end_addr;
> > > +
> > > +             /* skip last newline */
> > > +             start_pos =3D end_pos - 1;
> > > +             /* search previous newline */
> > > +             while (start_pos > page->data && start_pos[-1] !=3D '\n=
')
> > > +                     start_pos--;
> > > +             if (sscanf(start_pos, "%lx-%lx", &start_addr, &end_addr=
) =3D=3D 2) {
> > > +                     strncpy(last_line, start_pos, end_pos - start_p=
os);
> > > +                     last_line[end_pos - start_pos] =3D '\0';
> > > +                     return true;
> > > +             }
> > > +
> > > +             end_pos =3D start_pos - 1;
> > > +     }
> > > +
> > > +     return false;
> > > +}
> > > +
> > >  /* Read the last line of the first page and the first line of the se=
cond page */
> > >  static bool read_boundary_lines(FIXTURE_DATA(proc_maps_race) *self,
> > >                               struct line_content *last_line,
> > > @@ -207,8 +264,16 @@ static bool read_boundary_lines(FIXTURE_DATA(pro=
c_maps_race) *self,
> > >       if (!read_two_pages(self))
> > >               return false;
> > >
> > > -     copy_last_line(&self->page1, last_line->text);
> > > -     copy_first_line(&self->page2, first_line->text);
> > > +     if (self->maps_file =3D=3D MAPS) {
> > > +             copy_last_line(&self->page1, last_line->text);
> > > +             copy_first_line(&self->page2, first_line->text);
> > > +     } else if (self->maps_file =3D=3D SMAPS) {
> > > +             if (!copy_last_entry(&self->page1, last_line->text) ||
> > > +                 !copy_first_entry(&self->page2, first_line->text))
> > > +                     return false;
> > > +     } else {
> > > +             return false;
> > > +     }
> > >
> > >       return sscanf(last_line->text, "%lx-%lx", &last_line->start_add=
r,
> > >                     &last_line->end_addr) =3D=3D 2 &&
> > > @@ -464,6 +529,7 @@ FIXTURE_SETUP(proc_maps_race)
> > >  {
> > >       const char *verbose =3D getenv("VERBOSE");
> > >       const char *duration =3D getenv("DURATION");
> > > +     const char *maps_file =3D getenv("MAPS_FILE");
> > >       struct vma_modifier_info *mod_info;
> > >       pthread_mutexattr_t mutex_attr;
> > >       pthread_condattr_t cond_attr;
> > > @@ -474,6 +540,18 @@ FIXTURE_SETUP(proc_maps_race)
> > >
> > >       self->page_size =3D (unsigned long)sysconf(_SC_PAGESIZE);
> > >       self->verbose =3D verbose && !strncmp(verbose, "1", 1);
> > > +     if (maps_file) {
> > > +             if (!strcmp(maps_file, "maps")) {
> > > +                     self->maps_file =3D MAPS;
> > > +             } else if (!strcmp(maps_file, "smaps")) {
> > > +                     self->maps_file =3D SMAPS;
> > > +             } else {
> > > +                     ksft_print_msg("Unknown maps file %s\n", maps_f=
ile);
> > > +                     ksft_exit_fail();
> > > +             }
> > > +     } else {
> > > +             self->maps_file =3D MAPS;
> > > +     }
> > >       duration_sec =3D duration ? atol(duration) : 0;
> > >       self->duration_sec =3D duration_sec ? duration_sec : 5UL;
> > >
> > > @@ -540,7 +618,16 @@ FIXTURE_SETUP(proc_maps_race)
> > >               exit(0);
> > >       }
> > >
> > > -     sprintf(fname, "/proc/%d/maps", self->pid);
> > > +     switch (self->maps_file) {
> > > +     case MAPS:
> > > +             sprintf(fname, "/proc/%d/maps", self->pid);
> > > +             break;
> > > +     case SMAPS:
> > > +             sprintf(fname, "/proc/%d/smaps", self->pid);
> > > +             break;
> > > +     default:
> > > +             ksft_exit_fail();
> > > +     }
> > >       self->maps_fd =3D open(fname, O_RDONLY);
> > >       ASSERT_NE(self->maps_fd, -1);
> > >
> > > @@ -675,20 +762,20 @@ TEST_F(proc_maps_race, test_maps_tearing_from_s=
plit)
> > >               last_line_changed =3D strcmp(new_last_line.text, self->=
last_line.text) !=3D 0;
> > >               first_line_changed =3D strcmp(new_first_line.text, self=
->first_line.text) !=3D 0;
> > >               ASSERT_EQ(last_line_changed, first_line_changed);
> > > -
> > > -             /* Check if PROCMAP_QUERY ioclt() finds the right VMA *=
/
> > > -             ASSERT_TRUE(query_addr_at(self->maps_fd, mod_info->addr=
 + self->page_size,
> > > -                                       &vma_start, &vma_end));
> > > -             /*
> > > -              * The vma at the split address can be either the same =
as
> > > -              * original one (if read before the split) or the same =
as the
> > > -              * first line in the second page (if read after the spl=
it).
> > > -              */
> > > -             ASSERT_TRUE((vma_start =3D=3D self->last_line.start_add=
r &&
> > > -                          vma_end =3D=3D self->last_line.end_addr) |=
|
> > > -                         (vma_start =3D=3D split_first_line.start_ad=
dr &&
> > > -                          vma_end =3D=3D split_first_line.end_addr))=
;
> > > -
> > > +             if (self->maps_file =3D=3D MAPS) {
> > > +                     /* Check if PROCMAP_QUERY ioclt() finds the rig=
ht VMA */
> > > +                     ASSERT_TRUE(query_addr_at(self->maps_fd, mod_in=
fo->addr + self->page_size,
> > > +                                               &vma_start, &vma_end)=
);
> > > +                     /*
> > > +                      * The vma at the split address can be either t=
he same as
> > > +                      * original one (if read before the split) or t=
he same as the
> > > +                      * first line in the second page (if read after=
 the split).
> > > +                      */
> > > +                     ASSERT_TRUE((vma_start =3D=3D self->last_line.s=
tart_addr &&
> > > +                                  vma_end =3D=3D self->last_line.end=
_addr) ||
> > > +                                 (vma_start =3D=3D split_first_line.=
start_addr &&
> > > +                                  vma_end =3D=3D split_first_line.en=
d_addr));
> > > +             }
> > >               clock_gettime(CLOCK_MONOTONIC_COARSE, &end_ts);
> > >               end_test_iteration(&end_ts, self->verbose);
> > >       } while (end_ts.tv_sec - start_ts.tv_sec < self->duration_sec);
> > > @@ -758,17 +845,18 @@ TEST_F(proc_maps_race, test_maps_tearing_from_r=
esize)
> > >                                       strcmp(new_first_line.text, res=
tored_first_line.text),
> > >                                       "Expand result invalid", self))=
;
> > >               }
> > > -
> > > -             /* Check if PROCMAP_QUERY ioclt() finds the right VMA *=
/
> > > -             ASSERT_TRUE(query_addr_at(self->maps_fd, mod_info->addr=
, &vma_start, &vma_end));
> > > -             /*
> > > -              * The vma should stay at the same address and have eit=
her the
> > > -              * original size of 3 pages or 1 page if read after shr=
inking.
> > > -              */
> > > -             ASSERT_TRUE(vma_start =3D=3D self->last_line.start_addr=
 &&
> > > -                         (vma_end - vma_start =3D=3D self->page_size=
 * 3 ||
> > > -                          vma_end - vma_start =3D=3D self->page_size=
));
> > > -
> > > +             if (self->maps_file =3D=3D MAPS) {
> > > +                     /* Check if PROCMAP_QUERY ioclt() finds the rig=
ht VMA */
> > > +                     ASSERT_TRUE(query_addr_at(self->maps_fd, mod_in=
fo->addr,
> > > +                                               &vma_start, &vma_end)=
);
> > > +                     /*
> > > +                      * The vma should stay at the same address and =
have either the
> > > +                      * original size of 3 pages or 1 page if read a=
fter shrinking.
> > > +                      */
> > > +                     ASSERT_TRUE(vma_start =3D=3D self->last_line.st=
art_addr &&
> > > +                                 (vma_end - vma_start =3D=3D self->p=
age_size * 3 ||
> > > +                                  vma_end - vma_start =3D=3D self->p=
age_size));
> > > +             }
> > >               clock_gettime(CLOCK_MONOTONIC_COARSE, &end_ts);
> > >               end_test_iteration(&end_ts, self->verbose);
> > >       } while (end_ts.tv_sec - start_ts.tv_sec < self->duration_sec);
> > > @@ -838,20 +926,20 @@ TEST_F(proc_maps_race, test_maps_tearing_from_r=
emap)
> > >                                       strcmp(new_first_line.text, res=
tored_first_line.text),
> > >                                       "Remap restore result invalid",=
 self));
> > >               }
> > > -
> > > -             /* Check if PROCMAP_QUERY ioclt() finds the right VMA *=
/
> > > -             ASSERT_TRUE(query_addr_at(self->maps_fd, mod_info->addr=
 + self->page_size,
> > > -                                       &vma_start, &vma_end));
> > > -             /*
> > > -              * The vma should either stay at the same address and h=
ave the
> > > -              * original size of 3 pages or we should find the remap=
ped vma
> > > -              * at the remap destination address with size of 1 page=
.
> > > -              */
> > > -             ASSERT_TRUE((vma_start =3D=3D self->last_line.start_add=
r &&
> > > -                          vma_end - vma_start =3D=3D self->page_size=
 * 3) ||
> > > -                         (vma_start =3D=3D self->last_line.start_add=
r + self->page_size &&
> > > -                          vma_end - vma_start =3D=3D self->page_size=
));
> > > -
> > > +             if (self->maps_file =3D=3D MAPS) {
> > > +                     /* Check if PROCMAP_QUERY ioclt() finds the rig=
ht VMA */
> > > +                     ASSERT_TRUE(query_addr_at(self->maps_fd, mod_in=
fo->addr + self->page_size,
> > > +                                               &vma_start, &vma_end)=
);
> > > +                     /*
> > > +                      * The vma should either stay at the same addre=
ss and have the
> > > +                      * original size of 3 pages or we should find t=
he remapped vma
> > > +                      * at the remap destination address with size o=
f 1 page.
> > > +                      */
> > > +                     ASSERT_TRUE((vma_start =3D=3D self->last_line.s=
tart_addr &&
> > > +                                  vma_end - vma_start =3D=3D self->p=
age_size * 3) ||
> > > +                                 (vma_start =3D=3D self->last_line.s=
tart_addr + self->page_size &&
> > > +                                  vma_end - vma_start =3D=3D self->p=
age_size));
> > > +             }
> > >               clock_gettime(CLOCK_MONOTONIC_COARSE, &end_ts);
> > >               end_test_iteration(&end_ts, self->verbose);
> > >       } while (end_ts.tv_sec - start_ts.tv_sec < self->duration_sec);
> > > --
> > > 2.54.0.545.g6539524ca2-goog
> > >
