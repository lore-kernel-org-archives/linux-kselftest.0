Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3A242980C;
	Fri, 14 Aug 2026 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786695741; cv=none; b=U5LOjWCEZ2JsGdGxZgCxTJl6YYgj7TcCr8rRjeWe07qy3k6SyXbHtOdSxN6EbaKBcAqIbcPk8qr8MVxClK4PK6ZPZaYXjd6kpl9qL8UOhGjeziOuWRNZKRslLvWjkEcl/ubFO3PprRTNzzVvjB75n5bS1ienyGiJU7ojU9f+NRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786695741; c=relaxed/simple;
	bh=FBsZlgBQGZ+ZYRZ/YfO8ZoMaTCEuXFmELxcJ5Bio8kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgDBAeII/Dk3erBzjEgRRlR7vxRqcGe1RSWieyJb1cRIxbhwZpAIPGAkauQV5vAApIojdjWK5xnG7jtS5zeX0T68B2MBluH/g905f3SdK1joN646UgZT4LuvX9ObG/M2oQFtPOah1WDhgZxdYc73lnw5NNW7vqVuRnBp5Xi1xAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGdB8HlR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGdB8HlR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D746D1F000E9;
	Fri, 14 Aug 2026 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786695738;
	bh=EIsk+Wf4F0dnluT9f5h0Biozt4hmYjxe7upSyC3uPSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GGdB8HlRdNCLAI/kFaUg6q6hJdlaxu4wqup44Jfwh7ulG3dL4V+hKR2FQeEi4IhoZ
	 aM6+r4s8zYekwBX0+DQlFpQpIbYVJFRhfapJ9Bj63/1pEGSNKhi6liFAdm3Z5q9uM7
	 Y2bnBDJ0EV0k/tKGpsXFNZdsAX9iWoKdmjZWy3nWP6/UmVuejmROjAjj74ocXWYIvc
	 W3QmWkHq6qFWC34U2v64st0h9CWFGP7xx2t1/42JebrcEgsTi2OB5F2Mawkry60k2U
	 /exyBR6Ia9TlU2D5XBkOX9sSIAxkfMMVrRGwuKIze16rjcUQBrGO8kSKa+gFbY+alb
	 5W18TnBeDEpYA==
Date: Fri, 14 Aug 2026 09:21:59 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/secretmem: prevent uncharged mremap expansion after
 fork
Message-ID: <an7Emqen9f7W801p@lucifer>
References: <20260813225328.2010303-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813225328.2010303-1-4ncienth@gmail.com>

(I'm going to make an emacs macro to paste this now I think :)

Given it's 2026, you're a [relative?] newcomer to mm, and you've proposed a
patch for a very specific part of AI I have to ask - is this AI-generated?
If so please add an Assisted-by tag as per kernel procedure.
See https://docs.kernel.org/process/coding-assistants.html

On Fri, Aug 14, 2026 at 07:53:28AM +0900, Daehyeon Ko wrote:
> Secretmem mappings are charged against RLIMIT_MEMLOCK and marked
> VM_LOCKED because their pages are unevictable and removed from the direct
> map.

secretmem is weird in that it does mapping_set_unevictable() and _then_
marks things with VMA_LOCKED_BIT.

The description though is woefully incomplete - that should be called out.

I'm not really confident you understand this however.

Though 'charged' isn't really the right term here I'd say.

>
> dup_mmap() clears VM_LOCKED on the child copy, but mremap() uses that
> flag to decide whether an expansion needs a memlock limit check and
> accounting. An unprivileged child can therefore expand an inherited
> secretmem VMA past its limit and populate the added range.

'Unprivileged'? I mean where does privilege come into this? I don't see
capacity checks or needing escalated privileges anywhere.

And forking from a parent process can only be done by err, the parent
process?

And what does 'past its limit' mean? You mean the size of the file?

Well, already:

	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
		return vmf_error(-EINVAL);

Again you are lacking clarity and detail which speaks to a lack of
understanding.

You can already map a secretmem mapping of any size you like, but you'll
just end up the part of the range as invalid.

What I think you mean is only RLIMIT_LOCKED, and the fact that secretmem
seeds its folios as unevictable and uses this as its only limit aside from
memcg memory usage limits?

>
> Add a VMA open callback that marks secretmem copies without VM_LOCKED as
> VM_DONTEXPAND. dup_mmap() invokes the callback after clearing VM_LOCKED,
> while the original charged mapping retains its existing ability to grow
> within the limit.

Absolutely no to this. A complete abuse of the hook and an illegal
operation.

>
> Add a selftest that verifies expansion of an inherited secretmem VMA is
> rejected.
>
> Fixes: 1507f51255c9 ("mm: introduce memfd_secret system call to create "secret" memory areas")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>

This solution is a horrible hack that doesn't really make any sense at all.

You can expand something here on mremap, but I don't see what that would
get you.

The range not part of the inode's size and accesses outside its range would
SIGBUS.

I think what the real problem here is:

- Parent process gets some secretmem memory up to RLIMIT_LOCKED.
- Fork -> child.
- Parent exits.
- Child now has 0 VmLocked pages, can grab more secretmem memory past that limit.
- Rinse and repeat - can ignore RLIMIT_LOCKED for secretmem.

The real charging, i.e. memcg, all still remains correct.

Your patch doesn't fix this at all.

To address this would require some specific core mm logic to actually
ensure the range gets accounted by RLIMIT_LOCKED in the child, also.

I'll go think about that a bit.


> ---
>  mm/secretmem.c                            | 11 +++++
>  tools/testing/selftests/mm/memfd_secret.c | 58 ++++++++++++++++++++++-
>  2 files changed, 68 insertions(+), 1 deletion(-)
>
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index 4877c262cb1f6f..e5878ce91c768c 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -108,7 +108,18 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>  	return ret;
>  }
>
> +static void secretmem_open(struct vm_area_struct *vma)
> +{
> +	/*
> +	 * dup_mmap() clears VM_LOCKED before calling ->open().  Prevent an
> +	 * inherited, uncharged mapping from being expanded by mremap().
> +	 */
> +	if (!vma_test(vma, VMA_LOCKED_BIT))
> +		vma_set_flags(vma, VMA_DONTEXPAND_BIT);

This is a completely illegal operation.

You do not change a VMA from being functionally one thing to functionally
another on fork, especially something that makes a VMA have 'special'
properties like this.

And yet again I am reminded what a terrible idea it is to _ever_ pass a VMA
pointer to a hook anywhere.

> +}
> +
>  static const struct vm_operations_struct secretmem_vm_ops = {
> +	.open = secretmem_open,
>  	.fault = secretmem_fault,
>  };
>
> diff --git a/tools/testing/selftests/mm/memfd_secret.c b/tools/testing/selftests/mm/memfd_secret.c

For future reference - keep test patches to another commit.



> index aac4f795c327bd..3d33487eaaccf3 100644
> --- a/tools/testing/selftests/mm/memfd_secret.c
> +++ b/tools/testing/selftests/mm/memfd_secret.c
> @@ -84,6 +84,61 @@ static void test_mlock_limit(int fd)
>  	pass("mlock limit is respected\n");
>  }
>
> +static void test_mremap_after_fork(void)
> +{
> +	void *mem, *remapped;
> +	pid_t pid, waited;
> +	int fd, status;
> +
> +	fd = memfd_secret(0);
> +	if (fd < 0) {
> +		fail("memfd_secret failed: %s\n", strerror(errno));
> +		return;
> +	}
> +
> +	if (ftruncate(fd, page_size * 2)) {
> +		fail("ftruncate failed: %s\n", strerror(errno));
> +		goto close_fd;
> +	}
> +
> +	mem = mmap(NULL, page_size, prot, mode, fd, 0);
> +	if (mem == MAP_FAILED) {
> +		fail("unable to mmap secret memory: %s\n", strerror(errno));
> +		goto close_fd;
> +	}
> +
> +	pid = fork();
> +	if (pid < 0) {
> +		fail("fork failed: %s\n", strerror(errno));
> +		goto unmap;
> +	}
> +
> +	if (pid == 0) {
> +		remapped = mremap(mem, page_size, page_size * 2,
> +				  MREMAP_MAYMOVE);
> +		if (remapped != MAP_FAILED) {
> +			munmap(remapped, page_size * 2);
> +			_exit(KSFT_FAIL);
> +		}
> +		_exit(errno == EFAULT ? KSFT_PASS : KSFT_FAIL);
> +	}
> +
> +	do {
> +		waited = waitpid(pid, &status, 0);
> +	} while (waited < 0 && errno == EINTR);
> +
> +	if (waited == pid && WIFEXITED(status) &&
> +	    WEXITSTATUS(status) == KSFT_PASS)
> +		pass("mremap expansion after fork is blocked\n");
> +	else
> +		fail("mremap expansion after fork was not blocked\n");
> +
> +unmap:
> +	munmap(mem, page_size);
> +close_fd:
> +	close(fd);
> +}
> +
>  static void test_vmsplice(int fd, const char *desc)
>  {
>  	ssize_t transferred;
> @@ -297,7 +352,7 @@ static void prepare(void)
>  				   strerror(errno));
>  }
>
> -#define NUM_TESTS 6
> +#define NUM_TESTS 7
>
>  int main(int argc, char *argv[])
>  {
> @@ -320,6 +375,7 @@ int main(int argc, char *argv[])
>  		ksft_exit_fail_msg("ftruncate failed: %s\n", strerror(errno));
>
>  	test_mlock_limit(fd);
> +	test_mremap_after_fork();
>  	test_file_apis(fd);
>  	/*
>  	 * We have to run the first vmsplice test before any secretmem page was
> --
> 2.54.0
>

--
Cheers, Lorenzo
