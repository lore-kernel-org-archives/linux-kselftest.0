Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798795;
	b=DI/goxnMzxqlLyW4bswFB3s6s56g/I/LoD0A7cWFaxp7/3Mv9twmoQhZbREM36O2i5YQ
	 tRwfFvFXks4rJGejcxMj5aPoENwct37k/rTjEPKQrAdQdLP+x5IuGdEGTBtt9oAY8jrSX
	 ubXu+9NYmYzZax5xrRjpnb5Lm4A+/o4o5QVlhlcIKl4+DLkpoSYRTsp39sj+GJJelDyTA
	 fqt17ZRR95Jk1NEceNy+lRfya7/E/p5bemZI/EuWkOcyAR6iJRR5iIX7hdT6+nahIh757
	 WVdY7t4M0tzfr1Av+W/aVzQ9vOFpH12kntFEpt1wUK78r+Qasrak6kSTUYEOlGNlUlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798795;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=pvQk7gkgjyECtllSEXxMYHx9i1xSAVAK6APJPPvCqm0=;
	b=rLkcPk7LQHfyatL708vsutixMqJ9wBsJf0co+S1hHRX+48ci3/GhYpUHmjuS9DBI9uth
	 gwJvf3y9aBuMGyH9I7H0B4o5tQeuBiTA+Fcm4kzxqTYIiVhRlXVYI5H7/E17EzXezu7K2
	 QGSbEE9AxewaaVsTv1nHgjeusvBc8KlWpsXkn12vF32xrJJravsY5bPo1PHHv3hhT+uVv
	 sWvb+QMeVqGXGwU5SMw2wqkgk/xblYJDy+QvLByJPdEi/hxZEo2KDhR9OqM8DqOTF9RUC
	 WZk/DpQyswX2PgK+TauQWGH8D8cvQ3E57GYOLZuJdxEgESK9N4JHC4buxFozs2IuzZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AAQeB94N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6ED606A31B;
	Wed,  4 Nov 2026 13:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AAQeB94N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9C61F000C1;
	Wed,  4 Nov 2026 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798794;
	bh=pvQk7gkgjyECtllSEXxMYHx9i1xSAVAK6APJPPvCqm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=AAQeB94NpsdVxdbYF50v7JrxTJ1MLmAG6T5ILf5+I7BHKtmTQeMeLUsVdV9aAKJVb
	 F8aobQ2oDHgTUEkO+hLUrZO2Fs6BLUEX9y/S/oqQY7sF61wAP95BBkBCz+S2kZIm7M
	 2qygBxvGCen/9kY8WP5FXnqVn2NYpENQNyoFzj6xasHx04ktg3N7JTbponsO+FBA8O
	 MTq59fCOT+AWqw7PxNNGuzK5yvxfXmIt6oNkjBUWq3LDHFJtB9aJHmvFZQAf7pBYf5
	 Ai+VKaIUMG/mOwbCQu68+3iEQ7bkX8G/U0l1OHYMA92ntsVjriWAeYkIvkV0ZemmzI
	 mqKBfJJ0rQ/1g==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org,  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Christian Brauner <brauner@kernel.org>,  David Hildenbrand
 <david@kernel.org>,  Hugh Dickins <hughd@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  "Liam R. Howlett" <liam@infradead.org>,  Lorenzo
 Stoakes <ljs@kernel.org>,  Michal Hocko <mhocko@suse.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  Randy Dunlap <rdunlap@infradead.org>,
  Samiullah Khawaja <skhawaja@google.com>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 02/10] selftests: liveupdate: Add tests for preserve
 and retrieve user argument
In-Reply-To: <20261103010216.3447716-3-dmatlack@google.com> (David Matlack's
	message of "Tue, 3 Nov 2026 01:02:08 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-3-dmatlack@google.com>
Date: Wed, 04 Nov 2026 14:26:29 +0100
Message-ID: <2vxzzevok9ru.fsf@kernel.org>
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

On Tue, Nov 03 2026, David Matlack wrote:

> From: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> Verify the user argument support in LIVEUPDATE_SESSION_PRESERVE_FD and
> LIVEUPDATE_SESSION_RETRIEVE_FD. Add luo_session_preserve_fd_arg() and
> luo_session_retrieve_fd_arg() helpers to libliveupdate so tests can pass
> a handler-specific argument.
>
> Add a preserve_memfd_with_arg test case to verify that memfd
> preservation rejects a non-zero argument with -EOPNOTSUPP, accepts an
> explicit zero argument, and remains compatible with callers passing the
> legacy struct size up to the token field.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
