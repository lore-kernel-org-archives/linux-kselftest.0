Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166617;
	b=VjvJFJigly7QNiAHxQBV/0V2Ssd29swXod/tgeSd1gsAwHTYy8BYG8EjTwVe83S6kKpt
	 yuTiJ9zvbLiolImK3KPBE+JNvntqcNdsS271nAij2PLcAZ1I+Zn402DtzNnE32DFR6XdG
	 s6RlZmK4Sap0HhbE+HTH6bDM0LZVF+YcHXQ2ZNvBxE/UfRH7gK4uV67rW64/Pak/RphZF
	 PCSpHZoTDuzrQDdbOwf+2KHyg3TOjBzj15H9316KKTRpb2s7Rxb6cQlDzXdUzKVxNAKGE
	 RXZZo0lc74IHhrV7Pwux1JDAp9YNQLuN7YDiiaqR1/0vLbaoJybxvD7ch4d06UdAmgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166617;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UHW4M+q/Xhm54NFX+3u4JQAN1oFui+zkbZJdU7S2zo4=;
	b=OuRolAaS/Wm1T7OAmJBb1foqKPVx3dt/3fK7YmAw5bwChHAcC/1M/AMfZMTNtSz5CTTr
	 /yfdGaNMSWqrARqaYqViFWdUzsgGoLfKew+NeE1N2hiPRoRA4uKojj0idbHcIGcdO+LKP
	 pTb50N02WqgWgMw8PNIe7Uh0dFxmtR0tTAxJRjFRzJsDc1oZWuc0vtr65VXbGOrUBT9Hx
	 3mD2hEPSyMiuVz52eV4nJ7Rb+cy8JB2rOsCVdJ/dbhKanG1sql330M3avdt1AXhXDlA/g
	 8hcxuYXq+es2aeo8DHTwZhq777IuC8KHN5ADBA8GqTtNNlmXuRtryRa2DYDlA11iRyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WpxwFu+d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAD4606A320;
	Fri, 20 Nov 2026 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WpxwFu+d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456E71F000C6;
	Fri, 20 Nov 2026 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795166616;
	bh=UHW4M+q/Xhm54NFX+3u4JQAN1oFui+zkbZJdU7S2zo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WpxwFu+dBnk7TT+TAVvOCeGZiO/i95AKNUlvowfDJHUSAgOn1AMEi1CBG2K2tfp/Y
	 kRb4JmuT6xjrixrvoFrF3oQ1dT0X7AGsHkqw9WO6W/M14RzpjVe4aYupuKsArGkDRl
	 PcbsYr6xFO+th1S+LgcDKGkvCqZSIpB6SvOhYiq2nHQ7gXfsN4d+TzFutAxgThIqwj
	 CcXL9FpFXNqxgNeYqb5bWnsyL/0tp089iVZpGhFBSTPltZGX7jgip7ZzjQSuFF/UlC
	 ixURzNPzCCy5x7y4QtCO7KfNLHpovSsxg+f7b/rGq0BoQQVR7Fym73XF20qh+v5oS/
	 UlZ3cr8g877iw==
Date: Fri, 20 Nov 2026 10:23:28 +0100
From: Christian Brauner <brauner@kernel.org>
To: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v4 08/19] liveupdate: Let file handlers retrieve into an
 existing file
Message-ID: <20261120-gedulden-rausgeflogen-spruch-cea76174d5e2@brauner>
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-9-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111002358.1842967-9-dmatlack@google.com>

On Wed, Nov 11, 2026 at 12:23:46AM +0000, David Matlack wrote:
> A file that is restored into an existing file is already open in the
> caller, so installing a new file descriptor for it would just leave
> userspace with two file descriptors for the same open file. Retrieving
> the token again later still returns a new file descriptor, like for any
> other file that was already retrieved.

Thanks, this looks way better.

One thing: Please just install a new fd like for every other retrieve.
I think it's pretty meaningless to return the fd number the userspace
just passed to the ioctl.

The fd number is also not useful as it's not tied to anything. The shmem
handler looks the fd up once and LUO keeps a reference to the struct
file:

	CLASS(fd, target)(arg->fd);
	[...]
	args->file = get_file(file);
	args->fd = arg->fd;

Which means, another thread can close() that fd or dup2() something else
over it before the ioctl returns and the fd you hand back refers to a
different file fucking over the caller (shared fdtable etc pp).

That also gets rid of @fd in struct liveupdate_file_op_args and the
special case in luo_session_retrieve_fd(). And a retrieve into an
existing file then behaves exactly like retrieving the token again.
