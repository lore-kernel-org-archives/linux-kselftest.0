Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325538;
	b=A+aUGqcz5mluQIMdaeWw0x9kH1MMsGzwUA7xY8pbmKuRIUvfKohnXbbu+cnlsY9NfwHa
	 g3PpS+TW3Jm/3HsF/Q9ATAgNcfw0kLjkAhgK69KokUT9OKrHFCbRyY49KHH//+F7DqO/D
	 lzip1tKcEp+sAifH9RL/iT2JtRT6O0Qd0u2RGElk/g9drXBsoHWLj5ab1tJATa/NIXCUt
	 3CwvUQZVO6yc7aa8DItBEheEdq4JJN4DBdpxCg8ssU/kxiXhREvd4xvdtbPmM4zHU7ZyI
	 Zpl9rQcS6gG656na+SK4Px23wEuXjacERp+SsxEFxk8rfIxB2Gxis7ABqQJ+l8qIzlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325538;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=T4MRWNIKTZkEJgt6oLMqXnO3+RBTvl3UjB+JLMtpOKY=;
	b=MhR1hsIyM6YC55cvPd9OI+YuSpQiphgIZbcYYY+cty2BYz/DmHIs7lHfku3HuzBwu4ms
	 LiS+BYWJ/Px61M2uCVKb+5/uia7imIXwdCROAhvQ5He9V5TLus52zDd9+rMy6wgAhoMkq
	 UI9Pd3XERunuy2NadNHl1QP3SqWDkLgX4dEpkrXCrO7bSa6I/YOBPTFtlg9BL2bQqvgJo
	 F4bh2G0ztWpovWPljD8RK2vy9yVARP2ahKB7VUM70kEhXHKO8RD8z2Y/kwLK8fauqDk4Y
	 NEXvpNIdwrb8APx5yf3k0L/ja7f9NPee97HMCfAyHB0983+oOLNR0yH7g1prvifdNPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ukz+9Mhm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB59606C439;
	Tue, 10 Nov 2026 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ukz+9Mhm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F171F008A1;
	Tue, 10 Nov 2026 15:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794325537;
	bh=T4MRWNIKTZkEJgt6oLMqXnO3+RBTvl3UjB+JLMtpOKY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ukz+9MhmJgvTDWk/SeEpiCCkI/fDF9KMsJ5erGKGHdcFKSmOVmYTuc9CGKNmi6DYO
	 dkn7GN9I36tJwFurwtLxd9tnH4rhP3ZTL0xTnvt8Ej6TGmAUntAB+/8ZIcRXL2dQ+g
	 rifN3NXh9WBsTGWuMkwOlo+7aSbKUH3BUb/8YMVD5rvHHb+nZAmuu1RZ1qGQrm8aKZ
	 kcR26N0KwEtsC9GIr9bPuaxztpOFhhIPld6MzOkHAzbhZ/SmJaUr+k1/kb1ShQvPaB
	 ut0RjG/3MNIuOJ6mZDzOQw2lxSHNBQf8C7PmVh9omoU0F2pwM7nyjwYn7HlSS1l2OV
	 uoB3ljY2gbHUw==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: Christian Brauner <brauner@kernel.org>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-mm@kvack.org,  Alexander Graf
 <graf@amazon.com>,  Andrew Morton <akpm@linux-foundation.org>,  Baolin
 Wang <baolin.wang@linux.alibaba.com>,  David Hildenbrand
 <david@kernel.org>,  Hugh Dickins <hughd@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  "Liam R. Howlett" <liam@infradead.org>,  Lorenzo
 Stoakes <ljs@kernel.org>,  Michal Hocko <mhocko@suse.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  Randy Dunlap <rdunlap@infradead.org>,
  Samiullah Khawaja <skhawaja@google.com>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 00/10] liveupdate: Preserve tmpfs files across Live
 Update
In-Reply-To: <auy0ThryqW5nVx20@google.com> (David Matlack's message of "Thu, 5
	Nov 2026 16:52:30 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261105-sitzordnung-nahkampf-ausbleiben-6db911d0333e@brauner>
	<auy0ThryqW5nVx20@google.com>
Date: Tue, 10 Nov 2026 16:45:32 +0100
Message-ID: <2vxzbj7witb7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi David,

On Thu, Nov 05 2026, David Matlack wrote:

> On 2026-11-05 04:42 PM, Christian Brauner wrote:
>> On Tue, Nov 03, 2026 at 01:02:06AM +0000, David Matlack wrote:
[...]
>> So instead of LUO handing out a file descriptor for a file it invented,
>> let userspace create the file, O_TMPFILE, O_CREAT, whatever it likes,
>> with the owner, mode and xattrs it wants, and let LUO put the contents
>> into it. That's what the RFC did.
>
> I'm fine with going back to that in v4. The retrieve argument will just
> be a file descriptor for the target file, and LUO will only restore the
> contents and size into it. Everything else about the file is up to
> userspace.
>
>> The checks on the target are trivial: a writable fd to an empty shmem
>> file with the inode lock held while you fill it. A tmpfs file can't be
>> sealed, it only ever has F_SEAL_SEAL, so there's nothing to restore but
>> contents and size anyway.
>
> Sounds good. The one other check I plan to add is rejecting a target
> that LUO is already managing, e.g. a file that is preserved in an
> outgoing session and whose size is frozen.

I have been playing with this idea too, and I also stumbled onto this
problem.

You also need to make sure a preserve doesn't race with a retrieve.
Since userspace has access to the file, it can do both at the same time.
I think LUO should expose a "register file" function that registers the
file in luo_preserved_files. This should be the very first thing
retrieve does.

Also, today LUO core expects a fresh file from file handlers, so it
always installs a FD to that file in the task. When doing the "retrieve
into FD" thing, that will result in two FDs to the same file. While it
isn't a strict problem, it seems kinda ugly from a uAPI prespective.

Perhaps we should let retrieve signal to LUO core that "I already
installed the file", or a "I have no file to install", or something
similar?

>
> LUO will also add the folios while i_size is still 0, and set i_size
> last. So reads, page faults and memfd_pin_folios() wouldn't see the
> folios until the file is complete, and if the retrieve fails partway
> through the target is left empty.
>
[...]

-- 
Regards,
Pratyush Yadav
