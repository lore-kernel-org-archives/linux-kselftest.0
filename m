Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B126F3FAE08
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777060699; cv=pass; b=pj97uvtDXSBc0CSQvW8/P+lRj5jawnMUQoeA1Og0DNLsru9VirhB0+oK3Fb9vFOeui1bTT0zoVHD0BOrrsQbKTAAr6pGd6SIcw4HguCIF16vZna5oFKLLTINTR7ftqyluX7zgzNfxSArgmM75EQDM8MsX2f1CLanu4Neym+pCGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777060699; c=relaxed/simple;
	bh=swqZP6bwTIUcJ5KzcYIemDhYEvjynCxyftExGjuU4rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVd7303hr8HOO1RTbrUSkjfK3CdrZyD36w8luuXtlw+l5vvtwNcEJd3vLRSOaRd8NmqVKdKbRnRQYZjMdudbFvRyCd2z6MdBUuHoRahZ9MthqCBACSUxTwq9oe80/lMKGM7d5ILSK5el7rBethk3TQk+1vl9bIP7Kf68KO241Qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZryCtjif; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZryCtjif"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50d864c23bdso5153271cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 12:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777060697; cv=none;
        d=google.com; s=arc-20240605;
        b=GPHgFj7ilSaTuAAm/P7IVPV3FpJ3LtV3R4NDQ3GVbaLqy7coKQcmvbQ7+OHEGowxPO
         h5OIl01yP4jxs6OWog/K10pwjJssWyw44oOIAwc/pjKx8y37yHiaTyEF005VK3CISqzl
         YvCnAIc8wRGWr+EjjdYx/XTa8QY5FEdXN1cUOboeZdv+dyvwORvEGjw1w1Cv4+fJqjpt
         yy0o0A02sP9yJbZMrc+6CKH6He+p9nQl5yVUhU584N4jYVWKwMkeRI0awmIseS4+ImyP
         9Q9WUMqABj2AO4C4IF7HP2T8w+7Xbgv4uZN14p5Kex/Q9VrrYJemdt2QpE+DsNMdsOEW
         qUmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jx/+X7z1qY/OvSf5HyX8x1jyhWzg0V6nE8tOpGh+FOs=;
        fh=+cJ3UmeFDA4m82E6e9ZS4WMCy+CK3nOP0YM73a8F7XY=;
        b=Yn7mYGdrRNC5AtTnQI/5RrXeoAuAJTtwMNxbg1Km74af2VrjOIJ0YqXVZIff3XqX2/
         TmdejmfTkZt6b4xYInyaAhJYSnNke8OJuYJzIsJxF9yNuq1WlqTvWRslTIVUXGsujTEK
         ZeCQdgaekyHhlyjk7FAcNZoxRzbYpCWO3lLlyfqQAWQN7vmMnyVjPwJnLFYM5XaB/t1R
         G2Z+HEMP08Ja8oB7USuPDU3Vsng8+wiqmWuwAo6MiSIlDBR/C2B0UbsoEfcsHC+h5z+n
         UIn/qhfEcMiYV25RaiyJmgIc8NKOu0E7FVcwNMVyMRcey/ZKtTT/LRSo5csmtLC+9//d
         J+Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777060697; x=1777665497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx/+X7z1qY/OvSf5HyX8x1jyhWzg0V6nE8tOpGh+FOs=;
        b=ZryCtjif7bm2zeJaLziU1qTTapOZIcYBoIVADxLNCBV/Gx7a4vig6Klohi2JlhCv9h
         jiifEqZEaz0HCmfkHx17egwG2wqicAFz0J26N/KsfB8IkimK5kZV8/mFOyzdqAsJgWjK
         V5KANuGUT5fqfqCuy/s7BNi/A9uxkzsmBMxpl8TX7Tv23myDDp7PIkWw6b+dMXZxXrE2
         egKTTNkEbn//TMLBA8ApVpwd7QBHJjPFvytIYexChKcGRrT7nh3uj4KKWSKGpF8jBUeA
         UH7OwP1ompcY7dXeca61tK+geIzVFIdg4fmkEkolNU5H2+uarvmw448ZlHPA8MW5FObG
         QC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777060697; x=1777665497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jx/+X7z1qY/OvSf5HyX8x1jyhWzg0V6nE8tOpGh+FOs=;
        b=sxz/HsfcyJv/8aAw2J333p0B1yF5akdt9K0Qwcy18/p1IIeFVkKJf9rzpA2dQsmMlZ
         dulz0UbsbcNd7TllvGFd1ZQcwGK51/qSU9EhI62t6dyhS0i/e9TcD+ljzuNxKkMt5o16
         7yuwDpb/CM3Ja3P9aU5taBrOpz+b87zgyLQ6JYfcZjEkE2aihcUNhVvD1X3zU7utFrsZ
         TKcgbhMy5FlN15pGLIcJY3ElReLpNwWy4sKxTPCEbUBzIhvvXfnCALgIOZkyVXGMJ3p7
         m47Wi3T9IWUNThQ61ONzoz6EaKP9TgPRGCfd0wpXVD4RWqXt44Qzwhx4js7u3Pd/kAll
         m9mA==
X-Forwarded-Encrypted: i=1; AFNElJ8COVWrssPwCWemexg2HYK01OHxRE970qO0TH2YWZSIqSrP23CS95XOQMH8crwqVy52f26NclY+GRyyHIz3ITE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8JXTVGTLTRkCt11P+xTY5UWNkt/zp66wwGHYZAjroPcUmvQS9
	B2Tm03IvczBe9I49lG0+F6jyBCsVrkdeRQrOkWH9DFyT2MTEbjwQhd7ND/BfOrupvx3McJCCJU3
	7/jvEQfVs8sgq5iiCLAt6R8CWZb60LMGPYFsY9RI4
X-Gm-Gg: AeBDieuIPwwe2TCx5w3WOfNudjPj9vLYlAXklddAP8s3NgAlin6t0DJZ7y7eY+o0swL
	qKuBsuaJ+IG69fr4hmWjjozSb7Ext1cquIpYYYo9NaLyBoWQZhhs8wE0xVRHsk/U0Voox3G92jX
	b4QAjqRMEDDXljAqE6UmQcxwn8yV/cN99FYfJKWZ834q5imnrmqGB6cGTIs6z2FA4d2bi9NuSxH
	c9S/K0pdJEj7clv56fW7Q0UUNq49UCQ7XtRuVh+W1pwTJWehmzjWmoi5IxS97vAbKuPlsWn9IkZ
	xTx6tQNIMaq4WIm3eRmD1ahJsHQ=
X-Received: by 2002:a05:622a:248e:b0:50f:bea3:9475 with SMTP id
 d75a77b69052e-50fbea3aabdmr20044151cf.14.1777060696083; Fri, 24 Apr 2026
 12:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424070234.190145-1-surenb@google.com> <20260424070234.190145-3-surenb@google.com>
 <j3vswsvp6jp3hopogpc2qqre4mwneeffoutbytlgt6sah2blgz@33rsxbylk7bv>
In-Reply-To: <j3vswsvp6jp3hopogpc2qqre4mwneeffoutbytlgt6sah2blgz@33rsxbylk7bv>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 24 Apr 2026 12:58:05 -0700
X-Gm-Features: AQROBzB1Rx4ZvLow_W2QFHi8uxoLOiZRRVGVFV_nLgtZwxwfKXdBC5rKzdCtvYI
Message-ID: <CAJuCfpF+hE+Rf5mkJXBr1rc8_VX13RUu1MtQVaAZZRYRPskRXA@mail.gmail.com>
Subject: Re: [PATCH 2/3] selftests/proc: ensure the test is performed at the
 right page boundary
To: "Liam R. Howlett" <liam@infradead.org>
Cc: akpm@linux-foundation.org, ljs@kernel.org, vbabka@kernel.org, 
	david@redhat.com, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, shuah@kernel.org, hsukrut3@gmail.com, 
	richard.weiyang@gmail.com, reddybalavignesh9979@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 11:21=E2=80=AFAM Liam R. Howlett <liam@infradead.or=
g> wrote:
>
> On 26/04/24 12:02AM, Suren Baghdasaryan wrote:
> > When running tearing tests we need to ensure the pages we use include
> > VMAs that were mapped by the child process for this test. Currently we
> > always use the first two pages, checking VMAs at their boundaries and
> > this works, however once we add tests for /proc/pid/smaps, the first tw=
o
> > pages might not contain the VMAs that child modifies.
> > Locate the page that contains the first VMA mapped by the child and use
> > that and the next page for the test.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Reviewed-by: Liam R. Howlett <liam@infradead.org>

Thanks!

>
> > ---
> >  tools/testing/selftests/proc/proc-maps-race.c | 78 ++++++++++++++++---
> >  1 file changed, 68 insertions(+), 10 deletions(-)
> >
> > diff --git a/tools/testing/selftests/proc/proc-maps-race.c b/tools/test=
ing/selftests/proc/proc-maps-race.c
> > index a734553718da..c5031b0593b7 100644
> > --- a/tools/testing/selftests/proc/proc-maps-race.c
> > +++ b/tools/testing/selftests/proc/proc-maps-race.c
> > @@ -39,6 +39,13 @@
> >  #include <sys/types.h>
> >  #include <sys/wait.h>
> >
> > +#define min(a, b) \
> > +     ({ \
> > +             typeof(a) _a =3D (a); \
> > +             typeof(b) _b =3D (b); \
> > +             _a < _b ? _a : _b; \
> > +     })
> > +
>
> Another implementation of min in the selftests.  I guess it's somewhat
> unavoidable.

Yeah, I was looking for a good place to put it and reuse in other
tests but the only common part it seems is the harness and it didn't
feel like the right place to put it.

>
> >  /* /proc/pid/maps parsing routines */
> >  struct page_content {
> >       char *data;
> > @@ -77,6 +84,7 @@ FIXTURE(proc_maps_race)
> >       struct line_content first_line;
> >       unsigned long duration_sec;
> >       int shared_mem_size;
> > +     int skip_pages;
> >       int page_size;
> >       int vma_count;
> >       bool verbose;
> > @@ -105,27 +113,68 @@ struct vma_modifier_info {
> >       void *child_mapped_addr[];
> >  };
> >
> > -
> > -static bool read_two_pages(FIXTURE_DATA(proc_maps_race) *self)
> > +static bool read_page(FIXTURE_DATA(proc_maps_race) *self,
> > +                   struct page_content *page)
> >  {
> >       ssize_t  bytes_read;
> >
> > -     if (lseek(self->maps_fd, 0, SEEK_SET) < 0)
> > +     bytes_read =3D read(self->maps_fd, page->data, self->page_size);
> > +     if (bytes_read <=3D 0)
> >               return false;
> >
> > -     bytes_read =3D read(self->maps_fd, self->page1.data, self->page_s=
ize);
> > -     if (bytes_read <=3D 0)
> > +     /* Make sure data always ends with a newline character. */
> > +     if (page->data[bytes_read - 1] !=3D '\n')
> >               return false;
> >
> > -     self->page1.size =3D bytes_read;
> > +     page->size =3D bytes_read;
> >
> > -     bytes_read =3D read(self->maps_fd, self->page2.data, self->page_s=
ize);
> > -     if (bytes_read <=3D 0)
> > +     return true;
> > +}
> > +
> > +static int locate_containing_page(FIXTURE_DATA(proc_maps_race) *self,
> > +                               unsigned long addr, unsigned long size)
> > +{
> > +     unsigned long start, end;
> > +     int page =3D 0;
> > +
> > +     if (lseek(self->maps_fd, 0, SEEK_SET) < 0)
> > +             return -1;
> > +
> > +     while (true) {
> > +             char *curr_pos;
> > +             char *end_pos;
> > +
> > +             if (!read_page(self, &self->page1))
> > +                     return -1;
> > +
> > +             curr_pos =3D self->page1.data;
> > +             end_pos =3D self->page1.data + self->page1.size;
> > +             while (curr_pos < end_pos) {
> > +                     if (sscanf(curr_pos, "%lx-%lx", &start, &end) =3D=
=3D 2 &&
> > +                         start =3D=3D addr && end =3D=3D addr + size)
> > +                             return page;
> > +
> > +                     curr_pos =3D strchr(curr_pos, '\n');
> > +                     if (!curr_pos)
> > +                             break;
> > +                     curr_pos++;
> > +             }
> > +             page++;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static bool read_two_pages(FIXTURE_DATA(proc_maps_race) *self)
> > +{
> > +     if (lseek(self->maps_fd, 0, SEEK_SET) < 0)
> >               return false;
> >
> > -     self->page2.size =3D bytes_read;
> > +     for (int i =3D 0; i < self->skip_pages; i++)
> > +             if (!read_page(self, &self->page1))
> > +                     return false;
> >
> > -     return true;
> > +     return read_page(self, &self->page1) && read_page(self, &self->pa=
ge2);
> >  }
> >
> >  static void copy_first_line(struct page_content *page, char *first_lin=
e)
> > @@ -418,6 +467,8 @@ FIXTURE_SETUP(proc_maps_race)
> >       struct vma_modifier_info *mod_info;
> >       pthread_mutexattr_t mutex_attr;
> >       pthread_condattr_t cond_attr;
> > +     unsigned long first_map_addr;
> > +     unsigned long last_map_addr;
> >       unsigned long duration_sec;
> >       char fname[32];
> >
> > @@ -502,6 +553,13 @@ FIXTURE_SETUP(proc_maps_race)
> >       self->page2.data =3D malloc(self->page_size);
> >       ASSERT_NE(self->page2.data, NULL);
> >
> > +     first_map_addr =3D (unsigned long)mod_info->child_mapped_addr[0];
> > +     last_map_addr =3D (unsigned long)mod_info->child_mapped_addr[mod_=
info->vma_count - 1];
> > +
> > +     self->skip_pages =3D locate_containing_page(self,
> > +                                     min(first_map_addr, last_map_addr=
),
> > +                                     self->page_size * 3);
> > +     ASSERT_NE(self->skip_pages, -1);
> >       ASSERT_TRUE(read_boundary_lines(self, &self->last_line, &self->fi=
rst_line));
> >
> >       /*
> > --
> > 2.54.0.545.g6539524ca2-goog
> >
