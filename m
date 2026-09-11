Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACE4496D27;
	Fri, 11 Sep 2026 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145858; cv=none; b=YIa32jDfuY74/pI+ERFIzPV+euzcdh85DSCIWlsmjO1HXNAl6dXuIfcyWJGo7ycUkoZD1/ZPjyDeQXU+GYalOv+FkG1G/O6n17Fh5Hk67Oob6y8gIHSuz/7Kyr+PQUFrzs9atlERwwN99HrARMxtZZfxMbwl71v6fTULdDusJKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145858; c=relaxed/simple;
	bh=3mx6PrdObvyF8WW0Jdcutfev8hfubfa1ATNMVIM/KAQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XDNugs+wwA3P06RfmMMKKcQrQu0uWpLKR670VlUoRiNa83qhvvlN0mX4HBYx0ENNZL77Gm/qWSjlf8kzfG95R1SlJIT8Wjd8dHOhlpmAXhbtWdqgPvTRWGVQc1uuFsIUakQFtlnlE3MxbpxV5a4PcgHG6EDONekzLqtfeu9qYds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjIlMkhJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjIlMkhJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8CC1F000FF;
	Fri, 11 Sep 2026 16:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789145844;
	bh=IDBSfcifLQ8YcTFSg6uF4YASOXULRbdcHdp6yg1yH+A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DjIlMkhJugRR6Hz5v/P49dZvuvrtlHHzcSjoa+PDwXKFptddYTpowKD6TZgZgrFlp
	 cTZDRgmWpN4kYlPdJ6dpqwLpzrFis7WrDeOu+V1fEw+kALiQ29MW0ayC0jeMYQZewr
	 0AM/opPt8wMOwTf6D80jddrHeslR9YMDCfnKbtCUyzRfqF8GCRPQGIwW7ON3AZMncD
	 jRm2Bvpj/zodbWbFPr9zRrsR3+UcE8YEhvtJqxv2noj1yJDJxF0n+Fb5/GdD0px1AG
	 KPbn+tVJgStLdPgh7Yp+g366Qp3Rv+gymjeUHRyy4hjuUb/diY5t4KH9Rb+r+AAato
	 SkX7wqyXgwouw==
Subject:
 Re: [PATCH RESEND net-next] tools: ynl: Fix out-of-tree build for ynltool
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bobbyeshleman@gmail.com,
 donald.hunter@gmail.com, horms@kernel.org, shuah@kernel.org,
 matttbe@kernel.org, sdf@fomichev.me, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-kselftest@vger.kernel.org
Date: Fri, 11 Sep 2026 16:57:23 +0000
Message-ID: <178914584334.219967.14649627608959886945@kernel.org>
In-Reply-To: <20260910165451.1027541-1-maxime.chevallier@bootlin.com>
References: <20260910165451.1027541-1-maxime.chevallier@bootlin.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 2 · Low: 0

- [Medium] Incomplete $(OUTPUT) plumbing in
  tools/net/ynl/ynltool/Makefile: the patched rule `$(OUTPUT)%.o: %.c`…
- [Medium] The `install` target in tools/net/ynl/ynltool/Makefile (lines
  49-50) reuses `$(YNLTOOL)` as the destination file name: `$(INSTALL)…

--

tools: ynl: Fix out-of-tree build for ynltool

This changes the object compile rule in tools/net/ynl/ynltool/Makefile from
%.o: %.c to $(OUTPUT)%.o: %.c so that the pattern rule matches the
$(OUTPUT)-prefixed object names already used in OBJS.  This unblocks
make -C tools/net/ynl/ynltool O=<dir>, which previously stopped with
"No rule to make target '/tmp/o1/json_writer.o'".

Closes: https://lore.kernel.org/all/aqCyWQxqKDuQnZYR@devvm29614.prn0.facebook.com/

> diff --git a/tools/net/ynl/ynltool/Makefile b/tools/net/ynl/ynltool/Makefile
> index b8c67cdb4fdf0..1053e7606c86c 100644
> --- a/tools/net/ynl/ynltool/Makefile
> +++ b/tools/net/ynl/ynltool/Makefile
> @@ -31,7 +31,7 @@ $(YNLTOOL): ../libynl.a $(OBJS)
>  	$(Q)echo -e "\tLINK $@"
>  	$(Q)$(CC) $(CFLAGS) -o $@ $(OBJS) ../libynl.a -lm
>  
> -%.o: %.c ../libynl.a
> +$(OUTPUT)%.o: %.c ../libynl.a
>  	$(Q)echo -e "\tCC $@"
>  	$(Q)$(COMPILE.c) -MMD -c -o $@ $<

[Severity: Medium]
Since -MMD derives the depfile name from the -o argument, does this rule
now write the dependency files into $(OUTPUT) as well, i.e. /tmp/o1/foo.d
next to /tmp/o1/foo.o?

The consumer side of that convention still globs the source directory only:

tools/net/ynl/ynltool/Makefile:
	include $(wildcard *.d)

With OUTPUT set to an absolute path ending in '/' (tools/scripts/Makefile.include
defines OUTPUT := $(ABSOLUTE_O)/$(if $(subdir),$(subdir)/) when O= is given
on the command line), can *.d ever match /tmp/o1/*.d?  If it cannot, are
header dependencies simply untracked for the O= builds this patch enables?

The only remaining prerequisites of $(OUTPUT)%.o are the .c file and
../libynl.a, and that archive has no prerequisites of its own:

tools/net/ynl/ynltool/Makefile:
	../libynl.a:
		$(Q)$(MAKE) -C ../

so once ../libynl.a exists make treats it as up to date.  Does editing a
header under ../lib, or regenerating ../generated, then leave a stale
$(OUTPUT)foo.o to be re-linked into $(OUTPUT)ynltool?

Related, the clean recipe only touches the source directory:

tools/net/ynl/ynltool/Makefile:
	clean:
		rm -f *.o *.d *~

Is make O=/tmp/o1 clean a no-op for the artifacts the new rule produces,
leaving no way to force the rebuild?  Note distclean just below it is
$(OUTPUT)-aware through $(YNLTOOL).  Would it make sense to change the
include to $(wildcard $(OUTPUT)*.d) and the clean recipe to remove
$(OUTPUT)*.o and $(OUTPUT)*.d in the same patch?

[Severity: Medium]
The commit message says "Now, the O= parameter is correctly accounted for",
but there is another $(OUTPUT) consumer left in this same Makefile:

tools/net/ynl/ynltool/Makefile:
	YNLTOOL := $(OUTPUT)ynltool
	...
	bindir ?= /usr/bin

	install: $(YNLTOOL)
		$(INSTALL) -m 0755 $(YNLTOOL) $(DESTDIR)$(bindir)/$(YNLTOOL)

Since $(YNLTOOL) carries the absolute $(OUTPUT) prefix, does
make -C tools/net/ynl/ynltool O=/tmp/o1 install expand to

	install -m 0755 /tmp/o1/ynltool /usr/bin//tmp/o1/ynltool

and fail with ENOENT because the intermediate directories do not exist?
With a non-empty DESTDIR that happens to contain that nested path, would
the binary instead land somewhere unintended?

Should the destination be $(DESTDIR)$(bindir)/ynltool, or
$(DESTDIR)$(bindir)/$(notdir $(YNLTOOL))?

The same path is reachable from the parent Makefile, which recurses with

tools/net/ynl/Makefile:
	@make -C ynltool install

and a command-line O= is inherited through MAKEFLAGS, so does
make -C tools/net/ynl O=<dir> install fail the same way?

Unrelated to O=, bindir ?= /usr/bin hardcodes the path while the
prefix ?= /usr declared earlier in the same file is never used, whereas the
parent Makefile derives libdir and includedir from $(prefix).  Was the
inconsistency intended?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260910165451.1027541-1-maxime.chevallier%40bootlin.com
