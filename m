Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8712556B92
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791925667; cv=pass; b=iO+3w0pkj9Nry1J+j4Al60JUEkX2Rd4Z4iFNegevf+mMC3/opL2B8flu5xqoXduXoA8fQp4wpMmsA8uPF/Mhl1GlmZ5yoGpXhj5RGY3oZ8GIXNRvnngwX/DY2u6SOcNX6XHsVzW2YTEVeIeEm/8/TEjvn2bNiIWZm8dSUCyvL80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791925667; c=relaxed/simple;
	bh=DqDEbYEh/GJ2vJ0RGLy9Z6paqTuoI8W26g9AmRu7lXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m28bZAMlaa3RpCq5w0Sh5cYJpwNa2SV21pRmZdyBhcIcrRsCDkOaV3ghFN1rWw7gLSMHHpbbj7M/dWDsk+qte3W9MFpQWlv0oR1mrS/P+ICS0/hr6NxsraOinYS7DFkOL1oihd89Xu8Ol5S+SyTGd3MuKJ49zbowDJbtLRg4AWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L5aPoAAD; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L5aPoAAD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso28544085e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 14:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791925662; cv=none;
        d=google.com; s=arc-20260327;
        b=GQWTT8qT689pW6LbjV91l5nwNfWwH6dY3tGOEYI4nd56UbHOBFSYajicIYnt7rFcBY
         NC4M7FwLMCaR5Z30CK9cUWjj7b1xP7AHOcS57mpLBGR3rXL13fwRWqt+pXamgwP+AQzN
         /CHOu+sdKrS5CIsdpL2yR81QrBS9peadQu0QH4xvINARDmHn5nwrZ4EmMTEtVjt7qQkT
         dltwWWZGWwptKD8iLxpEGdOGZAMeG0YPiVmLUoSA9548W1wZabrrNq5n1St4Sg369nEj
         OJESyT9m3xBaDIZNvbAcIg1aUpj7KZWB2jv/nE4Rr2QnDbCHmup8IEd0aUBFljZpyxuy
         vlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GdU3BV11kOoBnWVHLMCH++e866lXi7j3hvDE5o3xs5M=;
        fh=dTbaUqDfMkrCOZjTHixoV7p6AkWBJ9f8E5+PlhnoYw8=;
        b=mnLshxdetmyzX/yBVIYFFde4X9sEotvYPct+HAm+2DMf8S+LHQ2S041h5V4BHwBCFn
         dA8wNXUSAwlwaVqUCBoulmU91Gb3B6suuvzyGxgY6c0FbtVwo3ubCOeZng2BbJSB+Qbm
         0vkH0yBbBlCxGwdEKw9qwaN6DhbxOcqZ+UoUF9E6mtE6VStIaVuQlI9N40MjbZJTvRen
         AkZksSFFkOtJDAQCS5px0F5NwdhNYbjzalKq1UNm00soKWplpNrijCNKC9U/O/+rCUZ0
         eL5fVn4dttnVV0BJblA125TRTMRlMLUdnxMdWZEFCTbcOy0PjI4tNXHcA9sFq+iU7tXL
         C8kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791925662; x=1792530462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GdU3BV11kOoBnWVHLMCH++e866lXi7j3hvDE5o3xs5M=;
        b=L5aPoAAD+NNDVx6W09G10m3WAuR3G3sCX8BqPX+J1bnvovjGj09mqmXXPQ+4YriBX9
         X4n+P0FUOkbJsZCBrNIP/7a4St1ZPIt9iEhkTLZWjtQN6xK/Ad1v2pLxg1AdvuuOHEDd
         /zxkU4OPz1cClI5fk3UxKO2ewyWNwqLvJoNuuVQ5NcAzTH0ci2TyymoV9SdcJgJuKQII
         fDRCdX9KVOEI3Hc9HJgHNn7RQYRwMQDmADo2AjOy4LkZOoKw85TGBdwC5IIeorTr2ghk
         a8N+kNN7M4S0ZrDMMDPz83ql/N7Ji3i3aWEf7WZyD/HkLVZSwNC2bNFxU6UJDkAf6vfv
         pxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791925662; x=1792530462;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdU3BV11kOoBnWVHLMCH++e866lXi7j3hvDE5o3xs5M=;
        b=O1gTHS7564Xs4FZBMAepMep8TRAsuh7MrbSoNY1RZVwMNa95QyQgQv8hQWVKft20wD
         j4+td7Ei+EWceP0c6d4UyYu7eb8E65SjGYo3+QmWW8iRx2ce8FkbBHoB5hWN6ezYgkzv
         Ooq+PzK36pLA7n9b2uMP8SLwSzCWo2EOvgRBLEKrvn3CdeByylTXosBO7tw4mlbqp2dr
         vJGX+FXx3YqQWRHNXiiwnqznv/KRAugx/Pw5z/LdWNCJxOl485oz//pAa1Bn+AFiC73T
         YNILOjCNmy3ME/Ogpc4xIcAOeCNp1dByPbXBDCE0lj99YmpYLWuw1aC3V4uJu6ehzWQ7
         Gowg==
X-Forwarded-Encrypted: i=1; AKwUvByKX+lJmocIcMHGdu/6miamNNltI4aWiz+Pbdyzd20VdHGRFMhhPShyDtmrAKOm6IJWi53Afp5pwquJ8RLE0ZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMcYosTkohiI3fbz5UBr0gYNOuMFfL6rcH6PIXS6nSzQ4CXNpQ
	yD2hk4W8C0qPhg16j8A9pcw26eX7b13Q4SNZkNiZDVsoMNt7ufgb45JZOM+aqwev47pmqz5a6Ma
	ofCsseGZGG8luMDY0dooX8T3yUhpjtIgazQwtErXN
X-Gm-Gg: AYBFou2ASPNzieg5Mc7JVFuwlO9Hq1nv6pY/3DXrW4mIZw8v7QYGgkfiiVkIq1FHctc
	PKfiCKSXaqKXa+gpt3dTDYoyTf9YLMfz8/BLP3L8PEs3SoF8E+pVSXCvFL0Y/ccxyGWmvioUZXS
	4Wx6Xdl2Cattm4fKKNrWp/AyEODx/64a2jbCIDTCzeGj1wNZmB0AHVJdu9KHrAHgakKOCZE2OVH
	PaBKYbnPKuXk1AG6/95hf5mCv136aiwbD9O7L/bMFuwooczAdViP7aWjiTh8vJFGbJd3yuHkbEw
	JRUge9riDOZaejF761X8dQ75CwApB6VYSNv2pw0ty5bQtp++GYZ2B1+YmnRrDBWCzNsbG/LFYxE
	R4WOmDJpu+zsubP/oOgrFhF4WT8sSB3QJ6ymQR07qb5D8TObBzYPiCg6NyLtSqrB/J6bqg8drZP
	E86y49mBvGl+D+8DShAhVBz3AeGqWEENnRzQgDcvMsrKu0AvM2OODb
X-Received: by 2002:a05:600c:a40a:b0:4a1:8eb4:46e2 with SMTP id
 5b1f17b1804b1-4a18eb4483bmr286389355e9.2.1791925660275; Tue, 13 Oct 2026
 14:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
In-Reply-To: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 13 Oct 2026 14:07:28 -0700
X-Gm-Features: AclHuK-BheBwPa0wu_bGJfIf0QRgUTJ9CBEgZWAxAmPkomjPVar_Q74zd4MM7Cw
Message-ID: <CAKwvOdmQkYy3xqTsumSxLdHpaXnt1Hb9g++DVmAYcx=cvjFBeg@mail.gmail.com>
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
To: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:40=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> The kselftest_deps.sh script currently takes a compiler as the first
> argument and uses it to check that libraries needed by the selftests
> are installed.  This works well for GCC where a separate binary is
> provided for each target architecture but is less of a good fit for
> LLVM where a single compiler binary can target all of the supported
> architetures.  Extend the script to accept "LLVM" as the compiler with
> an additional optional ARCH=3D argument so that it can be used when
> building with LLVM in a similar fashion to how the actual build works.
>
> The duplication with the main Makefile isn't ideal here.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/kselftest_deps.sh | 83 +++++++++++++++++++++++++=
++++--
>  1 file changed, 80 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/kselftest_deps.sh b/tools/testing/se=
lftests/kselftest_deps.sh
> index 487e49fdf2a6..70b834361cb7 100755
> --- a/tools/testing/selftests/kselftest_deps.sh
> +++ b/tools/testing/selftests/kselftest_deps.sh
> @@ -10,13 +10,20 @@
>  usage()
>  {
>
> -echo -e "Usage: $0 -[p] <compiler> [test_name]\n"
> +echo -e "Usage: $0 -[p] <compiler> [ARCH=3D<arch>] [test_name]\n"
>  echo -e "\tkselftest_deps.sh [-p] gcc"
>  echo -e "\tkselftest_deps.sh [-p] gcc mm"
>  echo -e "\tkselftest_deps.sh [-p] aarch64-linux-gnu-gcc"
> -echo -e "\tkselftest_deps.sh [-p] aarch64-linux-gnu-gcc mm\n"
> +echo -e "\tkselftest_deps.sh [-p] aarch64-linux-gnu-gcc mm"
> +echo -e "\tkselftest_deps.sh [-p] LLVM"
> +echo -e "\tkselftest_deps.sh [-p] LLVM ARCH=3Darm64 mm\n"
>  echo "- Should be run in selftests directory in the kernel repo."
>  echo "- Checks if Kselftests can be built/cross-built on a system."
> +echo "- Compiler can be given as LLVM to use clang, as with LLVM=3D1 in"
> +echo "  the kselftest build. LLVM=3D<prefix>/ and LLVM=3D-<suffix> selec=
t"
> +echo "  the clang binary as in the kselftest build. ARCH=3D<arch> select=
s"
> +echo "  the clang target architecture, defaulting to the host; it is"
> +echo "  ignored for other compilers."
>  echo "- Parses all test/sub-test Makefile to find library dependencies."
>  echo "- Runs compile test on a trivial C file with LDLIBS specified"
>  echo "  in the test Makefiles to identify missing library dependencies."
> @@ -53,13 +60,32 @@ while getopts "p" arg; do
>         esac
>  done
>
> +# Pull an optional ARCH=3D<arch> out of the remaining arguments. The
> +# environment is used if it is not given on the command line, as with
> +# make.
> +args=3D()
> +for arg in "$@"; do
> +       case "$arg" in
> +               ARCH=3D*)
> +               ARCH=3D${arg#ARCH=3D};;
> +               *)
> +               args+=3D("$arg");;
> +       esac
> +done
> +set -- "${args[@]}"
> +
>  if [ $# -eq 0 ]
>  then
>         usage
>  fi
>
>  # Compiler
> -CC=3D$1
> +case "$1" in
> +       LLVM|LLVM=3D*)
> +       setup_llvm "${1#LLVM}";;
> +       *)
> +       CC=3D$1;;
> +esac
>
>  tmp_file=3D$(mktemp).c
>  trap "rm -f $tmp_file.o $tmp_file $tmp_file.bin" EXIT
> @@ -178,6 +204,56 @@ exit $?
>  }
>  # end main()
>
> +# Mirror the LLVM handling in lib.mk: LLVM=3D<prefix>/ or LLVM=3D-<suffi=
x>
> +# select the clang binary, and ARCH selects the target triple with the
> +# host as the default.
> +setup_llvm()
> +{
> +       local llvm=3D${1#=3D}
> +       local llvm_prefix=3D""
> +       local llvm_suffix=3D""
> +       local clang
> +       local target
> +
> +       declare -A clang_target
> +       clang_target[arm]=3Darm-linux-gnueabi
> +       clang_target[arm64]=3Daarch64-linux-gnu
> +       clang_target[hexagon]=3Dhexagon-linux-musl
> +       clang_target[i386]=3Di386-linux-gnu
> +       clang_target[m68k]=3Dm68k-linux-gnu
> +       clang_target[mips]=3Dmipsel-linux-gnu
> +       clang_target[powerpc]=3Dpowerpc64le-linux-gnu
> +       clang_target[riscv]=3Driscv64-linux-gnu
> +       clang_target[s390]=3Ds390x-linux-gnu
> +       clang_target[x86]=3Dx86_64-linux-gnu

^ should this be either i386-linux-gnu or i686-linux-gnu, or does
`-m32` get set somewhere?

> +       clang_target[x86_64]=3Dx86_64-linux-gnu
> +
> +       case "$llvm" in
> +               */)
> +               llvm_prefix=3D$llvm;;
> +               -*)
> +               llvm_suffix=3D$llvm;;
> +       esac
> +       clang=3D${llvm_prefix}clang${llvm_suffix}
> +
> +       if [ -z "$ARCH" ]; then
> +               target=3D$($clang -print-target-triple 2>/dev/null)
> +               if [ -z "$target" ]; then
> +                       echo -e "\tUnable to run $clang ..."
> +                       exit 1
> +               fi
> +       else
> +               target=3D${clang_target[$ARCH]}
> +               if [ -z "$target" ]; then
> +                       echo -e "\tUnknown ARCH $ARCH for LLVM, supported=
:"
> +                       echo -e "\t$(echo "${!clang_target[*]}" | xargs -=
n1 | sort | xargs)"
> +                       exit 1
> +               fi
> +       fi
> +
> +       CC=3D"$clang --target=3D$target -fintegrated-as"
> +}
> +
>  all_tests()
>  {
>         for test in $l1_tests; do
> @@ -285,6 +361,7 @@ print_results()
>  {
>         echo -e "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D";
>         echo -e "Kselftest Dependency Check for [$0 $1 $2] results..."
> +       echo -e "Compiler: $CC"
>
>         if [ $print_targets -ne 0 ]
>         then
>
> ---
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm =
master
> change-id: 20261013-kselftest-deps-llvm-51be8d160008
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>


--=20
Thanks,
~Nick Desaulniers
