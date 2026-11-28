Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795895086;
	b=KFVuEYzh1u9p9PQJHStkPeZy7cmXLl5phMYUkjO18qdVZsXHlHMVC4IIEZhsTXEqEXN2
	 4jjMteIUbr4zGU10oKMQN5zx8+S8bmXN8t8UFkFz0d32H9CZRK9JNaUtnnxnY+peXlNMK
	 q9A84b4xP7VeZ636xDMKIBRd3ty3fnEeylBqmxNp/kGZzm3n4dQ92P8m/Lm6inRUaVDz8
	 VsowR+4GjwvMAzI3qPNrxuP1U0QO4q1HGjZvmX/SVYFzr98fKPZqglPi+cIm4/RQVl8AB
	 Cg/Qv/m/Ay7Ew9qUZzuNC7xA/1sh6G6U+/+A7PQkAIRwC9Jvi15eAinSAgrsoTnZy5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795895086;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PKALt7hreBaU4lqITNbcBBBAe8XT8p+lC6EjmmzM5Fk=;
	b=O+cS7bCtgWjSemKclknV5kftZHYH4QJnAOJdlifuyL1gpC8392UJBwXrIFyCZk5c2Akw
	 prJ6Lp+3QgQ2GKsOoJCYskJ6rDc9xrus6e0/nckZECFMDmX/dz8nBCX4Dkz4TV8drqfUx
	 Y9dY6rWm3ecgTsnq5BJQ/9TIyHwGRtCOV/48yxx1GhclHxnCKRUxEuLN/qpixhdAOXiSp
	 6i7ME96wKfZ6NLO2as9XZ7BcscySc2qOJf6fhrZi2LOrjEUrGGT/V+ZTn9ilTbesk2QcW
	 G0GLnpkL6x5PwN/NG4TPmkD42xzs2yoSSRqKK0lYE4eYEdhTJs3dtZrxvlzlXpHKwBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DD0x9DP8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 43C79606A31C;
	Sat, 28 Nov 2026 19:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DD0x9DP8
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1921E1F000C1;
	Sat, 28 Nov 2026 19:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795895085;
	bh=PKALt7hreBaU4lqITNbcBBBAe8XT8p+lC6EjmmzM5Fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DD0x9DP8aD1aAwYk/3tUsEpCwT9l4VasfqqRiBfhqkTGKxQKNGhRz8+FE1NAwPVrw
	 Uir1j+JWzO7hpvN2salBtwMXnB0wmfVPMV/oV/3GTAMYJnr2GIOYvuqcVmBHKSB8Be
	 +vyA2shTm6jAxA2qmtiS7RT7D7KwvBMUWweU3aG6WkKfh/h6h+WFld9KQujYEaV00z
	 pKmGhZ+PLZUQEWZ0ZdcQre4CSvX2rSy/HdUnwJ43ntwvdU01RWvOZgcY39WxjPU98s
	 mN2WgN5TI7ehoa1TqukkF0seLhC0ELec29C5T6rfPPDgFDfey1ewHyR6QajtE4nujU
	 6s22dQBnk5d4g==
Date: Sat, 28 Nov 2026 21:44:41 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: bpf@vger.kernel.org, containers@lists.linux.dev,
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-security-module@vger.kernel.org,
	Aleksa Sarai <aleksa@amutable.com>,
	Alexander Mikhalitsyn <alex@amutable.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Lutomirski <luto@amacapital.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Giuseppe Scrivano <giuseppe@scrivano.org>,
	Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Josef Bacik <josef@toxicpanda.com>, Kees Cook <kees@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Lennart Poettering <lennart@poettering.net>,
	Neal Gompa <neal@gompa.dev>, Oleg Nesterov <oleg@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Serge Hallyn <sergeh@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
Message-ID: <awsvKemo8ZZQGu7e@kernel.org>
References: <20261122193539.3334213-1-jarkko@kernel.org>
 <awYJnFNt9kkBqj59@kernel.org>
 <awsVeNYhLWEhZYId@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awsVeNYhLWEhZYId@kernel.org>

On Sat, Nov 28, 2026 at 07:55:08PM +0200, Jarkko Sakkinen wrote:
> On Wed, Nov 25, 2026 at 12:03:08AM +0200, Jarkko Sakkinen wrote:
> > 1. Rebased RFC v7 patches with refined LSM support and fixes to the
> >    known issues as of today:
> >    https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/?h=userland
> > 2. SystemD patches:
> >    https://github.com/jarkkojs/systemd/commits/userland/
> 
> Bubblewrap: https://github.com/jarkkojs/bubblewrap/commits/userland
> 
> README.md update explains all this:
> 
> 	When supported by the running kernel, bubblewrap opportunistically uses
> 	userns_set_idmap() to configure user namespace ID mappings and
> 	userland_open() with CLONE_INTO_USERLAND to populate the sandbox mount
> 	namespace directly without pivot_root(), falling back to
> 	/proc/<pid>/{uid_map,setgroups,gid_map} and classic namespace cloning
> 	otherwise.
> 
> Podman ought to be similar wiring as SystemD so that does not have as
> much demonstrative value (but would be equally trivial to accomplish).

README.md update for Podman:

	On Linux kernels supporting `userns_set_idmap(2)` and
	`userland_open(2)`, Podman opportunistically configures user namespace
	ID mappings via `userns_set_idmap(2)` (falling back to
	`/proc/<pid>/{setgroups,uid_map,gid_map}` otherwise) and provides a
	built-in `userland` runtime (`--runtime=userland`, also used
	opportunistically for default pod infra containers with private user
	namespaces) that populates detached mount namespaces and spawns
	container processes directly via `CLONE_INTO_USERLAND` without an
	embryonic init process.

https://github.com/jarkkojs/podman/commits/userland/

Br, Jarkko


Br, Jarkko
