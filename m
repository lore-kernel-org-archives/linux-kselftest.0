Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937361;
	b=wqMx67DNGhHfTHwRvooqm3MhAuFQwniluS3FHzbI6kynZhC8ibFRWix2oRfEss53ottQ
	 JoJhvpnwHy5eNYbaaIj4GU05cdyei2p1iyuIzoTVFVCNKCgKm92c52FZYhaoq8y5lQ2TR
	 zYSbzzHjQYw4VrI0hsFtPeJdddKMbeRV0BdZDUytSPa+UijQcmicLdghaPmZvJUasdZG1
	 QZ51uwgJmTKold5KiA9gdaE+1WrMwIoUlJdmjUZFvkH11GPjgArCgaeFfZzKZcBjj1wau
	 hJNNPULt/sdThH2eDGyIaP52pqKa8PUsmSCfomU54UH4RP5gB7K31hI3LwNnvqPSW/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C0Br6uNbCeSZG/D0SaMC7uBQz4y4PQvjObMC5HHmvxw=;
	b=G51XInUxllwAodfiXYewunG1+DuX3Bfs1TuY1HjOhvC8cFeHTw2bKdTy+irab94vdwUe
	 1M5SlPNb/jaDQN02pcxErfXoluCS0Zx31wmKFg1GCKkuBv1M3ylbnCoO5vkMOlsB4ENF+
	 I4Cw07BxIXEXPfvu8SaWZEh52oK2lw9W1e4Fdj71QfuCM+Z68dwW8uVtCUGRnRnAVspum
	 JUiG7VZ0abnVx6Q01P4fSdD//pE1Cp423hieK2Zv2y8waOSlMI08o1cHO3IDOsmgmYdmJ
	 +nhV2N4OzWKPE3eOog2u8kh2wdpKm4VA4X2yEffYTl2W12fcBrIxBo9sZG9cItYOIcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EEvWGAFb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B34606A331
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 17:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B34606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EEvWGAFb
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae417eb235so1196401fa.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 09:42:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937359; cv=none;
        d=google.com; s=arc-20260327;
        b=CT22JlB8QgkMbZveUIdCX3/6EVZdbmw7MoCDwqagZqak+h5TJVgNcZrtHn7fpFm23w
         ydgnmtruI14UofZ3IcymLHPy44EDo7z/PniHZjIQldSHAhh8zyq7OMAEqMrPzpEKmnRl
         U43zfxhpWt9QvSeXQ9DsJGJ+VHtoubFIcznbLb5YdvlgBcgMXOHnx2yV0JM2QKpOGaw0
         CYUWvWrdESCp9jd59j/m5XZa97T0EByRuH3QVpAsFoKPQTdLFJYbi7NzSIK25CGi0R9L
         YT3LMghQw5zdhEo1B9uUPKucd2Ji1v7Z7+A05FvirKsMJ1iV190UDt2ufjoYsTcvnS+Z
         iahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C0Br6uNbCeSZG/D0SaMC7uBQz4y4PQvjObMC5HHmvxw=;
        fh=cbYG72i/MGYQZZUm4i85JyEK+gE1PQFciVyf0qCJzK4=;
        b=fw00Kz2neVXM/JlpeBrdBdhcSOASrZTK2HiUO5LSiEdMcbPu37al2C5cx0/0XyEvpn
         Lg6JvoQ2gXkcvM9HP2BxRYe481KPPkBD/65YLunm+JaKsqFCPyf3b2E867Gl1i82y4jb
         h1VvxewqW5XhCy9lvdfIwstHZk6vQwr1mZppyiAE/XtmmOIC9V7IW0c0NpQoWGCrW7GW
         rtH6asfhKI46YRGh7S3XjSzv1grZtMyKEQuc0OWlVdbfPP6sThajWbOUEUm5uO8jp6eX
         OQZyrQqWD/qvpaBvBLMj7JNCuMMlN13VTCA5Nyk7eWdJL2XRwwX5/EOqhhzd9agZW/b3
         yZRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794937359; x=1795542159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0Br6uNbCeSZG/D0SaMC7uBQz4y4PQvjObMC5HHmvxw=;
        b=EEvWGAFbOmPz0e1bruaOl0rjybH0s4KDHt1ZdsIprIDdOYSYYFkdgv0P5ZbqLm9wOt
         QUKZ38KmXI7yBp+GV0/eyJrlR0x9jaOEr3Ii55nnjpnVrQIiwkaoActJokk0nmQSZd7G
         61WKKrB70e3ufmKjp4oHO9TAABVl1efKkOpBvtOYK6RF6gVHy0E+rjZz0xIx57DanHDh
         1TInlFBGPv/IJYMg1cTj312Sc7q2gHY8Ugtu6+Jpk/LKIOoiULHPpgJvsVB0ghEN1g8q
         2dPQMdyQdgbZ8hjQrp+yJxxt3I0107KE+viwJ2hHYYVk4FGOG+dWGVAy9wgHIHfa0LWA
         TeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937359; x=1795542159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0Br6uNbCeSZG/D0SaMC7uBQz4y4PQvjObMC5HHmvxw=;
        b=BgDKFuoIcSd70Tl3XDPSHvpX3w2gKH6sjZRmVn250gkIZlH34kAooEPhHpWyzSqnoR
         g7pUcesppJ6zjJEY1KvFCNByauB8p6ra/ARtZ9MlBT5T/f+B6erjzQEU91VAj8Vnexuk
         D9vOjeuyWwMyAsBAdxL65Rf3S5nHjHzKXAMQz5x6p2ZuW874/mBmzZK6JPLCitWnABxo
         4XHkOaneRhjFjCfguMVRFnWGlCMO9GplWEB3fuiGF4XPCsITxN+oIKXuarooLf9iBKp6
         6XyRUvmVnRfZotKaVJsGF4BC4JyHYF6NB2ElijpSMWKyu5yizwDu/pQi5m4Rez6CvvWV
         /u/A==
X-Forwarded-Encrypted: i=1; AL+hErGGpoIrxB8Z6MDs1GCSBF9z0ivNCS9vpeb4zj3CkJ0IYW1Fjnu4Jdw8Qna4VQ3z4kvJlZispdCL+OXIA+8Ooa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iRt4XD1xa8+03XFtYSQBz/NPJTUXSfjxjJ59ZabcKyeZpH+Ak
	8mGOuV3NarEMxjdCVaUzFBNSb62KxE2K7yKaCgEkLX8i2LtVlpxd8q/NDZKa+YwO+FwuqFfq19B
	TbK0aOaLUMP1p9XJD+0ju5cWKzvyJibkVsKRbt/cI
X-Gm-Gg: AYBFou14DjZwaT3QyKFPJxlxaZK9fhfoTXT0aGW9xoDLmhKTJDdantOKeYpZfFKW0u6
	Mp3skUlihI6ahCUa4n0uGqU4+OoP//h6nRa3u3N7R3PuBwT2wD7olxoLuAfgGm4bh9OKe823K3s
	i7Jp+2HAQ5W38JH8pfEeH0wrbZC2oBseP6AQnCJ2siVyiESkgYLYVTVEHAFmfXB4pMTf9KOOJI+
	k0f+8RlR1CL8x5uGdqXwaQTRT9BA/HVd0svcNhw/YWpM6p0BD1bCeuUepn1Np0UcEQf4lzc0U5O
	6zC6q0TLDJ4WrRS9fMUjRIu2onZ4Gaa9tbnUiP/nRvzyhvbDnFC2AtGmRVntPPmbcuc/MiuE4rc
	Lx6mgyJCMF2Y2H/CFB1M2SUCR0ldYxU9pmg==
X-Received: by 2002:ac2:4bc9:0:b0:5c1:4ccf:f0b8 with SMTP id
 2adb3069b0e04-5c170a0bb3cmr7252657e87.16.1794937358574; Tue, 17 Nov 2026
 09:42:38 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117050841.3289652-1-jarkko@kernel.org> <20261117050841.3289652-8-jarkko@kernel.org>
In-Reply-To: <20261117050841.3289652-8-jarkko@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 17 Nov 2026 09:42:26 -0800
X-Gm-Features: Aa3M54o6AJsup2EB_D5C3UIkkriS8wK22wW9apyv8KKATx5_DoWBh2HrH9mfDyU
Message-ID: <CALCETrWtbUFQGDOCHkxAN9O4i29ixfL5KKF1Cqw2-CjxKwC6gQ@mail.gmail.com>
Subject: Re: [RFC PATCH 07/13] rootns: Add rootns_enter() system call
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Ben Segall <bsegall@google.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>, 
	Juri Lelli <juri.lelli@redhat.com>, Kees Cook <kees@kernel.org>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Manfred Spraul <manfred@colorfullife.com>, Mel Gorman <mgorman@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Paul Moore <paul@paul-moore.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Serge Hallyn <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Suren Baghdasaryan <surenb@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Vlastimil Babka <vbabka@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 9:09=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> Multithreaded userspace daemons cannot call setns(CLONE_NEWUSER) or
> safely mutate process-wide filesystem state in place before spawning a
> child into a target namespace set.
>
> Add the rootns_enter() system call to fork a child process directly into
> a rootns whose root mount has been installed. Transition the rootns from
> ROOTNS_READY through ROOTNS_FORKING to ROOTNS_RUNNING for the first
> process so it becomes PID 1, serialize concurrent entrants on waitq
> until bootstrap resolves, and admit subsequent callers into the running
> PID namespace until teardown begins.
>
> Require CAP_SYS_ADMIN in the target user namespace, forbid credential or
> PR_SET_NO_NEW_PRIVS privilege escalation

Why are you disallowing this if no_new_privs?

This isn't necessarily a showstopper, but fork() is really quite slow
in many cases.  It would be nice to have a more spawn-like API
available.  I assume it's possible to open a file in the target's
mountns by some sane API even without entering that mountns, as a side
effect of how the fsopen / move_mount mechanism works.

--Andy
