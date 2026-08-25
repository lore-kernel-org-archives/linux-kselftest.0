Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0805137188B;
	Tue, 25 Aug 2026 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787675905; cv=none; b=XltcupnYukzyX3s6K009wNzt9lojqws5RnYyMc3WdvNAMqmd1CcMdJ7rxJ+GB6hyCNHEJ4s6Byr1jJxPosABXhOsR7T9aNJygFrTmZcmPGAh4V+v/WlLUUlW3Ll3ghyC45OMgIkSMa7wFgtVjHvo6BmxQ8k/hTPY7xbJykvX8e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787675905; c=relaxed/simple;
	bh=KHEFsEFlriPfn9xExvhOOctvqsJVMZuuaWR6qIWp7JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxkz4Byx2DT9DomRvZtizGRc/tKw1hnL7JY6qJAZAPTRu70kXdQkYk5Q7dvsP8Di59MxE9iAfNSf0MeU2zNaHIsPIXBL4w9fg9HgZAugEMVvSgmlIckE/ixknT7+arP+h8sZZJ7kC6nG66uTtYtPYFg+F5sjX4+Pb6aPpjvp9mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=irp/I+X1; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="irp/I+X1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1787675901;
	bh=KHEFsEFlriPfn9xExvhOOctvqsJVMZuuaWR6qIWp7JU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irp/I+X1PNLdPCd76uNVI6RaVP/dqYxDIWL1JMHDu/kTcpUhXFMeotH5EzH3adAj+
	 TiK3M3g4qr5/qhB2efaaft4Pw92oO/zY4jlgetEM1q0k2LTyYyM1jEmGzHmJYvhCO/
	 KgcWdzspdvQ/DGoXowwTmJHRmernsc7sW+8prEic=
Date: Tue, 25 Aug 2026 18:38:20 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: David Laight <david.laight.linux@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: add 64-bit parisc support
Message-ID: <d6eae620-d483-4afd-803a-d8f6ea2029ac@t-8ch.de>
References: <20260820-nolibc-parisc64-v1-1-067ebe7c8efb@weissschuh.net>
 <20260824091958.7810094f@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824091958.7810094f@pumpkin>

On 2026-08-24 09:19:58+0100, David Laight wrote:
> On Thu, 20 Aug 2026 11:32:50 +0200
> Thomas Weißschuh <linux@weissschuh.net> wrote:
> 
> > Extend the existing parisc support to also handle 64-bit mode.
> > 
> > Some peculiarities:
> > * The nonstandard ftruncate64 system call requires a workaround.
> > * The linker defaults to main() as entry point, which needs to be
> >   switched to _start() explicitly.
> > * The linker defaults to dynamic linking, which needs to be disabled
> >   explicitly.
> > * With the default -Os, gcc does not use 64-bit multiplication
> >   instructions, requiring libgcc. Use -O2 instead.
> > * There is no qemu-user available.
> > * CONFIG_COMPAT needs to be disabled to avoid build errors due to a
> >   missing 32-bit vDSO compiler.
> ...
> > diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/selftests/nolibc/run-tests.sh
> > index 3da806e2b302..a50a47d9df2c 100755
> > --- a/tools/testing/selftests/nolibc/run-tests.sh
> > +++ b/tools/testing/selftests/nolibc/run-tests.sh
> > @@ -29,7 +29,7 @@ all_archs=(
> >  	sparc32 sparc64
> >  	m68k
> >  	sh4
> > -	parisc32
> > +	parisc32 parisc64
> >  	alpha
> >  	hexagon
> >  )
> > @@ -122,6 +122,7 @@ crosstool_arch() {
> >  	sparc*) echo sparc64;;
> >  	x32*) echo x86_64;;
> >  	parisc32) echo hppa;;
> > +	parisc64) echo hppa64;;
> >  	*) echo "$1";;
> >  	esac
> >  }
> > @@ -206,11 +207,11 @@ test_arch() {
> >  			exit 1
> >  	esac
> >  	printf '%-15s' "$arch:"
> > -	if [ "$arch" = "m68k" -o "$arch" = "sh4" -o "$arch" = "openrisc" -o "$arch" = "parisc32" -o "$arch" = "alpha" ] && [ "$llvm" = "1" ]; then
> > +	if [ "$arch" = "m68k" -o "$arch" = "sh4" -o "$arch" = "openrisc" -o "$arch" = "parisc*" -o "$arch" = "alpha" ] && [ "$llvm" = "1" ]; then
> 
> Would it be better to put the llvm condition first?

Ack, I'll switch this in a preparatory patch.

> 
> >  		echo "Unsupported configuration"
> 
> "Unsupported compiler" ?

Not much difference IMO.

> >  		return
> >  	fi
> > -	if [ "$arch" = "x32" ] && [ "$test_mode" = "user" ]; then
> > +	if [ "$arch" = "x32" -o "$arch" = "parisc64" ] && [ "$test_mode" = "user" ]; then
> 
> Ditto.

Ack, as above.


Thanks,
Thomas
