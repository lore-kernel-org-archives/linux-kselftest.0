Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174568;
	b=JMzjNbP/cBLgQvHNQWuJAx2rAQCUQu23pUSp3cU5hOFfDa6Kd5Utsx7U10YVjEQXGgHf
	 Udk+xVHPivhtbGKp+P3C4Bff3YIcqih5uLU5XnsYFKzxcPDsBqJuL/5MqRxZYqbmgE2sz
	 XRVzD0h0fNGJBMPQme6bYjdZMiTer9uzo/mE0S2q8jeEH/jTv7WebwfY5R6kE71h/AQ2t
	 +Ow/XvS6PGGN1vVFevlAXArwOKEbROZoczj44FCShfJxliA5kD3vhZXw70OWpI9bCskXz
	 JVC2g5hyF2oaLTEUda4W28quYhuTu9eC8jGqWsbH5Okvy5wxrnPYJeGuOTZ6bmU+1ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174568;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=NIe3hOKLCnHqFNzGUF054ejmgeEIVGuZTJTbO+auWw8=;
	b=UXM2sm5e16TEwwwHS2QZO+GocK/7SPriD6OByGgMXx6Gt4BBXJUBYaVXcb/HQXw6r9Xg
	 rpuFKhH5qftyqIg4lkYZFVRySKrOjVZj77LECbF+e+gF1nAtkNbTkObtdm3cUf8TKl22y
	 td+nw0p1cufk/66epB9zg2QRkc7Kv/oH2bgE9eRNfP/id6IxAd8yACYKTZ60wU3mc7Hhr
	 CvIllzv95QXwOccLdtOrOxUDEiEFudvIqPc43oZL8tbbNKGHSGQrJIIW6U7ywzTXkpewX
	 jWuzeMqg22PbWwlNmn+FUXVW7N9rXuLVxov1OQkTHn1yrgSik1WFeovg8k/gZkzqkdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNVf3e2f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76235606A325;
	Fri, 20 Nov 2026 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNVf3e2f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C0E1F000D1;
	Fri, 20 Nov 2026 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174568;
	bh=NIe3hOKLCnHqFNzGUF054ejmgeEIVGuZTJTbO+auWw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LNVf3e2fuB6sV6i+MOVpjyM8ou9ybEJWd/y2YnESvyNqyqZDV/JUVifcofk3GSUh9
	 wdDRIJZgSFB03R34CTubN4uNtnYupEInqCHzDpZSNOvG391LTBj34OpEYqI8reWNJF
	 fxGiQTz24XlLet/fihwDGBNU9jRmT5QHyqZ4XW2KeqI+1m7PNKK022IPB1zUXwsRuf
	 o9/IvtHEr8a8yFSdiQOcoB9AEKq4dXLYytA8O11f5kEhZrEBfMs8qPfnTvKsOsJEaZ
	 wzbWR5kBFfbuI/qOpigQGtu4DM8/GbQsjMEEquZ3MudbSYuenkNEPnv/ezcqMiAkS4
	 oGlsk2V2hEp5A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: David Matlack <dmatlack@google.com>,  kexec@lists.infradead.org,
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
Subject: Re: [PATCH v4 08/19] liveupdate: Let file handlers retrieve into an
 existing file
In-Reply-To: <20261120-gedulden-rausgeflogen-spruch-cea76174d5e2@brauner>
	(Christian Brauner's message of "Fri, 20 Nov 2026 10:23:28 +0100")
References: <20261111002358.1842967-1-dmatlack@google.com>
	<20261111002358.1842967-9-dmatlack@google.com>
	<20261120-gedulden-rausgeflogen-spruch-cea76174d5e2@brauner>
Date: Fri, 20 Nov 2026 11:36:01 +0000
Message-ID: <2vxz7bi73fby.fsf@kernel.org>
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

On Fri, Nov 20 2026, Christian Brauner wrote:

> On Wed, Nov 11, 2026 at 12:23:46AM +0000, David Matlack wrote:
>> A file that is restored into an existing file is already open in the
>> caller, so installing a new file descriptor for it would just leave
>> userspace with two file descriptors for the same open file. Retrieving
>> the token again later still returns a new file descriptor, like for any
>> other file that was already retrieved.
>
> Thanks, this looks way better.
>
> One thing: Please just install a new fd like for every other retrieve.
> I think it's pretty meaningless to return the fd number the userspace
> just passed to the ioctl.
>
> The fd number is also not useful as it's not tied to anything. The shmem
> handler looks the fd up once and LUO keeps a reference to the struct
> file:
>
> 	CLASS(fd, target)(arg->fd);
> 	[...]
> 	args->file = get_file(file);
> 	args->fd = arg->fd;
>
> Which means, another thread can close() that fd or dup2() something else
> over it before the ioctl returns and the fd you hand back refers to a
> different file fucking over the caller (shared fdtable etc pp).
>
> That also gets rid of @fd in struct liveupdate_file_op_args and the
> special case in luo_session_retrieve_fd(). And a retrieve into an
> existing file then behaves exactly like retrieving the token again.

I suggested this approach because I found it odd to return a FD that
userspace already asked us to retrieve into. Any sane userspace would
just end up closing one of the two. I didn't think of this race though.
I reckon we could return -1 in the FD that LUO returns, and let
userspace use the FD it already has to work around this. If userspace
wants to close the FD in the meantime, that's their problem. They don't
get the file they asked for.

While I like this more, it's not a super strong preference. So if you
still insist on having a new FD, that's fine too I suppose.

-- 
Regards,
Pratyush Yadav
