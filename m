Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C670330668
	for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634110; cv=pass; b=MFr8BsnoJrYpSGdJLnWhG0Zf+zhvpbFs+LaKSx38DcXG/cEZSptW7epI1TYcQKd99sA1+I0B24+g8wjgPtnsphYTZ6Mcq83jSWrg9Gmh/7vkeBcWrzGCERk/KzaCagygcGra5iJsz9NUPIRbVSD4g8TF9MswXhg6noxAX014jWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634110; c=relaxed/simple;
	bh=x9qJm+avegIUJI6SAL7wt0w/pqHUEP/qvv8/0tXHV6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQ87CgH2UGOeJiqNS2015r/dQaG5GOVlIFQk3HhKvPabWF3RVFENhBKNxw4t5y2V91S2Af0K9P8LVqFkCp4l4SeAUWS+GpJfJDntVjvkIlRXp1Z5LMxbb0RzqrCsn6KOFVwevcvsoef+fwsgGKnnkgHQ5cV+hB0wPzHo5qdk3VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONRMy6ec; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONRMy6ec"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd9a71b565aso966932866b.0
        for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 07:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779634107; cv=none;
        d=google.com; s=arc-20240605;
        b=f6F/qYLpoAkWFXYNnrLJGMJTKhSPYikm83ItLkf4t09RXe4paa/U4PlZf7rNk4CVrR
         T+Apq4mwLkjhz2dGxO8CcRhEA89wjmRIvaZUh/GgenS3w0rL5gqasnHps1GN0SZttP02
         apR6aUokfcEyGHlXshPGfwJMXuenGl7O1qnpEjbfIiESm7L3TzYpCRiS/GYjpgItG19N
         br6fgwmQ7TJ0TpYRgp8or+2IR18jMF2jlXtg3WYtAZSU4FVPGjhKMHwfWxir5T+KHHW1
         7oAXifydck8Cd8OStWd2/oaQEDrXVfZ3l/EX3lQmnKtPtJ/2jMG3qQDxfup6ctTfz+NW
         bYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kiaxFrOd0FXB1269UrWJLsrAPCN4GiKOHlkHSLubSMc=;
        fh=1n/yaJVwfXr/mxEZ62f9nv/8sP0IitYgWS83ewL5cPw=;
        b=C83CEv12AFma4nu9uSjoy6z/zvvNv4edAVMU7z1mpNLWzDzWTkqTeNZbQSjVSRZmgl
         EtjhcdFjrilM1iLTo5loxz1hMf6NjCVfYATHhcaiMkd99zIQrk4lW/xzTpdKIgcj+r49
         UBlaa3kn+Sc49iPgC4MKoQYNz0mFDEkJwJufHqKPjXmRf0G9Z3FubRBbPeJwXAROFXcU
         gRdo7viY8X3kBvnXVKbmhdV0d7wEuLz3a7c80nRKUusIbTKW0Oz1sjlBRM+xxeiKRO3t
         i32+ObxZ6q+wPHpqEe55GqEvUCbhn1nniMI4peS8HwFTtISbb7QbDaorXDobuMVICty4
         B8Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779634107; x=1780238907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiaxFrOd0FXB1269UrWJLsrAPCN4GiKOHlkHSLubSMc=;
        b=ONRMy6ecWHXZXRJsgjq8ahYjHBJ760pbARgrY7xuuJUud68kptUiflPU/DlFWAzNZA
         hwJEYBGxfUE2g4tR1qCVSMOl9iXayive5Ilm+Na4ukqzG8un45dghVucHtXNOVZIYogu
         1totdA3ZseEmIvw0ZKX/Ko78pYazUc+EKG5Eij02QHGijMbLxcM/g2lN52hMKrC/3Vf1
         j/JrZ/IRcR8T73V+5TlKn4BsuyVtFN2+fp2fWzN/HktRUcyejCM24w4Lv0H1VV3p5uga
         gGWxztuHGR8v319y7I7WXlE7aRbju9QJjE8PDyiZdBhF0n2ErewtmoA/WRQ+/H/Rgriz
         QaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779634107; x=1780238907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiaxFrOd0FXB1269UrWJLsrAPCN4GiKOHlkHSLubSMc=;
        b=T3qGmUFJcc4GV4nIF4EwEgXMyDF6q4sgIfZ18Mz9dOZnHd9qK1c0Blp+1MhadLKRtD
         G1oX+lFSb0F1Hlsg8nj/3WpjbAZ3vL8AWe5yM+1IXLoo2UezZaXymGVEgO9wCumTIjNS
         d0PWpGt2AMj7gOd5LkpSDTWn4WQJyIG4qZjwHn7qiVqWILxbjyrPgVmtVHEp9V8GTF5N
         M0pBzPBJRZo+76vw4Us3RdrRvt8CCTLLxB/QyGMnirYfULhk5V7YUoAmarcRJyYvu5Yu
         jNoogjU1EQSgpsND0RZJlZmsMgwzH2oZSS2Mej8xeprbadPYc3pcOgmkzShnz+snSgpy
         DPPw==
X-Forwarded-Encrypted: i=1; AFNElJ8EJQnAQ8gDim9XqweMv/Q5GrWEqPYK8hs4RMgtfqsComKG4MLZplhqN+YQ8o2BmxgJOT7+d+W3IYkg4r8c3eQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YylZMcls1nlG5FitxqKGIjng6zst0Kad/XHOhRq5kINDG3JNfAf
	iyzy1EHTFpVtyoEaUW2NC8Lsm9x7o7zqNWdTyOXDGzMfF1BmTYobgVYbqczHJXCPDUjnQtPMk98
	MtkOyFRVayojnWoXHJ5ApU4l8x3/E3W8=
X-Gm-Gg: Acq92OFAU000mfm2e6sC7aJ+8LiAfKjFAL2j2nntNx6ysxJtPn+jO/vKmpHNoFaN85m
	RSMHGq8IwqLk6ep8GjiTiCOLgGTJtDLwl1tcC2aSvSZYNlIddo+kgPLWyGXkrNu60WOVUIPOFUU
	KVVvKkQF6l485GTGVyobGtBRkCyu52jfv1u3xijXW/IoZaOHPTYnAZmP24ExTnGQuRCfut90oTc
	8DLZ7ang8WU5MY70/X12tYCnfmbM50akOyhx/yXuWxHoA/FrCaqV9CAf4AQj36I/BgBHj/eAMBh
	kp6K9Uo6Nmkh/oVvJhWVrAAKgCmAMedvh5fAwqw=
X-Received: by 2002:a17:906:31cb:b0:bdf:b95e:98df with SMTP id
 a640c23a62f3a-bdfb95ea97dmr133789466b.7.1779634106434; Sun, 24 May 2026
 07:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-fix_pipe-v2-0-a8b35a78244e@debian.org>
 <20260522-fix_pipe-v2-1-a8b35a78244e@debian.org> <ahHVM9hCP65hH82S@redhat.com>
 <ahMK_mWcooqrd9Hc@gmail.com>
In-Reply-To: <ahMK_mWcooqrd9Hc@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sun, 24 May 2026 16:48:14 +0200
X-Gm-Features: AVHnY4Kjj4ieWodc5RzfU3uO7T_bRVuRnlBRZFMlo083AArFEgI-h98qjZJFV5s
Message-ID: <CAGudoHEPj-aOxqBsh5y4JFfONLnZfzgw_UUs5hqK6BpBcgHO5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] fs/pipe: pre-allocate pages outside pipe->mutex in anon_pipe_write
To: Breno Leitao <leitao@debian.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Shuah Khan <shuah@kernel.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, shakeel.butt@linux.dev, jlayton@kernel.org, 
	axboe@kernel.dk, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 4:30=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> On Sat, May 23, 2026 at 06:26:27PM +0200, Oleg Nesterov wrote:
> > > @@ -566,7 +661,9 @@ anon_pipe_write(struct kiocb *iocb, struct iov_it=
er *from)
> > >              * after waiting we need to re-check whether the pipe
> > >              * become empty while we dropped the lock.
> > >              */
> > > +           anon_pipe_refill_tmp_pages(pipe, &prealloc);
> > >             mutex_unlock(&pipe->mutex);
> > > +           anon_pipe_free_pages(&prealloc);
> >
> > Do we really want to call anon_pipe_free_pages() at this point?
> >
> > The main loop will continue when pipe_writable() becomes true again...
>
> I went back and forth on this. The argument for freeing was that
> wait_event_interruptible_exclusive() can sleep arbitrarily long (slow or
> stopped reader), and holding up the prealloc pages felt antisocial --
> especially under the memory pressure this series targets, where those pag=
es are
> more useful on the freelists than parked on a sleeping task.
>
> On the other side, on wakeup the loop is guaranteed to want pages again, =
and
> re-entering the allocator under the mutex puts us back in the contended s=
tate
> the patch removes. For any write() large enough to wait mid-syscall (whic=
h is
> the workload patch 2/2 measures), keeping them strictly wins on throughpu=
t /
> p99.
>

You can still prealloc after wakeup for whatever reminder you got
though, but I can agree dropping these frees is a sensible way out and
it is easier and I'm not going to insist on one way or the other.

However, I think it would be prudent to add a tracepoint to some
machines on your fleet to find out how often they allocate pages under
the mutex (and for what i/o size). Initial alloc for the first write <
PAGE_SIZE definitely happens under the mutex which is probably not a
problem, but for anything later? The tracepoint can have a trivial
indicator if this is the first write if that matters. One can
speculate all day, nothing beats checking what happens.
