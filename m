Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8FB21A459;
	Tue,  3 Feb 2026 18:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770143092; cv=none; b=Cq5XoTP1B8yr7Vt/O3CqT6S7a6dorje+YDZvBH8MPDhO2ggyfBhRrDE8oGTNwjE0EsyYLp+WH+fv/ICfcQPCMkK9pewvs4zie4lZUF0UgOefHgB424Myf9qTg8KicHLM7sB9wZJvaOJhtqNiAgiWkC12551nRos5z7fdswLFqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770143092; c=relaxed/simple;
	bh=YzTjrZJbH8OeyKLaisUTbTaoykM0RuGcnlbNDerd3Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNGCggRNSWDL1lBGvEoKxyRhIqXnpvf4Nk3w3HSx4oH82ZVtWV1otH7Hsmj6vOzT5iiV08kALC8nBByES3ZmeYuxU8ubWjXzwnjyNT+iIUwgnP93uR3b2I+RcX3mX6XhE66dPp0mqWS8vBy8sfc3FJ56zANwqBhD4HspxJeY2Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obdfKwqp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obdfKwqp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDE4C116D0;
	Tue,  3 Feb 2026 18:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770143091;
	bh=YzTjrZJbH8OeyKLaisUTbTaoykM0RuGcnlbNDerd3Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obdfKwqpZsX/GP+rmROdAhoiPpdQEdBr9Jj7Rl06Nfa127mXROHBHWLvwnp50YwGI
	 /YZ+UsX7cEGVrA/NlsN/ZmrphOIrXjK7JrEmAmFBRWAgN8uW5s/x50anYbX74Sn/gl
	 f2gB+7AhCDKUc+iCIEM7ITUzOg1M+lyGNNmIelCOCNR/JtiLvJZdWy8sFih5IdiJr7
	 1w+cmIkB5rBHrfI/BsQ+1KYZ5BCKORWAsmNjLP5rgpFHpKY1l4quPqXzaibN6sdmgx
	 gvmf86im7mIGJm1Fr3umwigcl56+qHWMYtXHq9ixoF2EMEzalm0fJbiS9ZGdw59n6t
	 E5/+z6oD5w3FA==
Date: Tue, 3 Feb 2026 20:24:45 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jordan Richards <jordanrichards@google.com>
Cc: dmatlack@google.com, jasonmiu@google.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	pasha.tatashin@soleen.com, pratyush@kernel.org, shuah@kernel.org
Subject: Re: [PATCH] selftests/liveupdate: add end to end test infrastructure
 and scripts
Message-ID: <aYI9bUEodBEU6Zq3@kernel.org>
References: <aXj28ZAsPhp7s5sm@kernel.org>
 <20260202214859.662889-1-jordanrichards@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202214859.662889-1-jordanrichards@google.com>

On Mon, Feb 02, 2026 at 09:48:59PM +0000, Jordan Richards wrote:
> Hi Mike,
> 
> Thanks for the feedback.
> 
> >> +int sys_ftruncate(int fd, off_t length)
> >> +{
> >> +     return my_syscall2(__NR_ftruncate, fd, length);
> >> +}
> >> +
> >> +int ftruncate(int fd, off_t length)
> >> +{
> >> +     return __sysret(sys_ftruncate(fd, length));
> >> +}
> >
> > These should be added to nolibc I suppose.
> 
> I notice that nolibc has its own tree. If I patch nolibc/sys.h,
> will those changes make their way there? Or should I avoid modifying
> nolibc/sys.h and keep this local copy for now, to be removed if/when
> ftruncate is added to nolibc?

I think you can make this a set of two patches: the first that adds
ftruncate to nolibc and the second with LUO test.

Then with an Ack from nolibc maintainer both can be merged via Andrew's tree.

-- 
Sincerely yours,
Mike.
