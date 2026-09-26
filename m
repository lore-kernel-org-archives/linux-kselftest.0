Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C38379998
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790407267; cv=pass; b=USZzn4KA6BrGP7lOtMkfmWURKlgPv+EpBvsNVeSUj5Z7MHUt1pZMntgOD889UX3OH3tPWb8Z/DlKknB/CYS89eMppjFUsljHjPYXNGt409r9U6KQ3c7BxB1YwAI+vtxyc7IpHfDwwhCU1wYXYk+7S753WjDGDS7CpTiiwk8GVGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790407267; c=relaxed/simple;
	bh=JSaZbVji5Ea0/OPC5PqKZgfN3e3cz3ZXBga9A0C+uKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o1SHXcqIyfTQK6RmL7P4A5Fj8mBTNmSNhPQkHFZvEXdNymc93QImBlxbraPkOe1MAJzWAy06loAen8WrwVFviYB82iZqohUall0KZ4edynUYgccMlsWTa9msCErStap46yyXJiJUuOJl+hwaA6yfjbuuwQREQJrVQFV/Ks4JklM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiFKN0jM; arc=pass smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiFKN0jM"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881d9da69b1so27147b3a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 00:21:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790407266; cv=none;
        d=google.com; s=arc-20260327;
        b=Rm//p5zhJSS7hnEhPrVV1MysjLxt+nDUdusC1kzOamyXlZCfj6XFeaPaJ+UmdUE3J8
         +kQw7VHaK2ht0+QgjRaJ4p6K/3xyzr4RpZ0Ca9Om9wj1Mpc5yqgCNVTPA37FAjdxaxNs
         wbpCrYAGwxjCZ3F971R06F/7VsWMNyTgPF+N46wELVqS8u5nk2Cvk5kmSWBSNPLrj7jj
         KeU92KdCVEJngigqwiRLUF3FmMMYLZN+VlyV6rJPUUCi7ab8B2hiINCkCuURRTulcERE
         qlW17XggRVYjR0P53oZQvy27JZXsIJpvCqdYRZRhsbe3pbDmKXInNceQ7yfa+i7sMEZA
         vH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1fxaPqNTjN/pMftWjOpORDKiV+ubgNTjPPityCn5HVI=;
        fh=XkJLTgrXNUm9bxFZvW9LQeDagu7lmulGha20k1DlhIc=;
        b=c9ATYKHcepIrguJDp8fMOCjzS1nFckb1iSHFGf273wzR/2EAz6qanGpe9bTAkCJaiV
         FasaEhMVjM82rjKiO7tzn61a4O12bx4a9DYoYMgygcCS6F512weJBVGfkusQXADHcI0j
         iQvIms60kK7z5XOB5h8yt8OkaI/4EzREBRFTU6bdAIHCMvomp+qdo/vMAGqSsp2jkUun
         4WWEaxWk2FOdFIJis3RfH5d6Y4iyUoF5nEqEr3j/pEQ6IRsP1nSUwj4dR0kSY1I15+1M
         OFjJP5zgZxRtwu2MLx/EhFc7KX4N5LBbOBLytpKkufTJi3yFLaleUe+ez4t0YDOph8hG
         yiOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790407266; x=1791012066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1fxaPqNTjN/pMftWjOpORDKiV+ubgNTjPPityCn5HVI=;
        b=UiFKN0jMrvECP/uSEfD3uEzWB/mgENKtlUlqBAspgFoegQ00d62sHE6Q6ggA60ftk8
         epA8RuPOvmXFTzAcxhugyXkhrxeZBSFWo4dfkaUggmdZ/Kfr1QIHno+qiLZaqNH4jyqW
         KgtjPoK+1FkQd0Xg2ou0pSriUKwUN6l9ymxub4oVhorJhoExSRQNLYGBNzfkiq50sME8
         S3bDbbYgXUsbdZgLiOyErwjO98SC3iz2YmjVVlht8n5pruVeXvnhlmUGZUbxLY+QEQSN
         xlXgAV49GRLCtPuazuqGgPxPy+YZiYJZjDVOr2jCsWlCTc4wSJBcyC5XJQMZdWCtVQSd
         0YGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790407266; x=1791012066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fxaPqNTjN/pMftWjOpORDKiV+ubgNTjPPityCn5HVI=;
        b=TsI9vL1rTrWJmsPkyZcIQ/H09xSZOapu7enhHsRZZsxRzRCQXP+qQVx0BrZVJB2F3s
         ze/qPjNOROV1mjN2dcaXNFIcY+ZQz97k6Zh2T2DPSRBbTM6VtK6GOS1beDwmSjRHdzvr
         QTUuehSWszPd8cQx9wzMAEsQiCFaqLo3KHsg0NBMwZ7RpfBTOaD56v7Ou2PhkHcQBRw+
         cNiFHQGf77pyCDTYnKsIAmYg6b84XLajM0w4EVZmlOll70NclIEzz6rZCempKEeNxz2m
         znLsFkkV0fSsZ+f48FmkDlRJbszZo33DVaJG2NY4z5+dITOriWVZOeqt/Ze+dRSFfYlN
         cykw==
X-Forwarded-Encrypted: i=1; AKwUvBzVqhT4iF1I1onnJFKuuelBX+tbGplNatZ6NaGiG0HDrdOsqcMcYGXVNd7QdWvY3kTvfXw5arHCt4LgYN3dvjU=@vger.kernel.org
X-Gm-Message-State: AFuF++knaA72FMMG0Q7yx16dCVMmuUHzP9iGctiQsixuZSbxmnIu5kQk
	0vo5D/aYpRjPNlJ2WuuWm1r44wt2glhQNudd9NyULk0wT+ONx+9TMXUp7YbZzNjwKAoRl6sAnc6
	jVlpoFtCdaARJCKYVGiiKygOEPRvhJBY=
X-Gm-Gg: AYBFou2tfcxA27T88YNcYhAEeMdg/4tm/v7+pw2bgxn2cTbr0WJwKmJx7bK29A6VxNW
	0NlQEbuk/8Z7xZ2LPPD/O4rXrGEktniOvYfG0r2Y8GckcDewyEHJtOEu7amOl8rCJTjHpqo4Su4
	BG+8+jfVgZMXJv07E/Vj7jk6nyqzhiVbSy1qTtM1wqek78hZMojKy/NUkBIEXHMVghuLlJ6cU5o
	ecBtmH45kozW/jXufeErw6WMZ3FRKFGUZzedIop0mgNUV2PnujumHAwnCGS+r67ReHoXMEi+kbc
	ifNZhkA6o8M51pT46fDgwCPu5rslurtTwnIWTykTPk4p09I++VA+seg=
X-Received: by 2002:a05:6a20:a11d:b0:3d7:dfbf:7435 with SMTP id
 adf61e73a8af0-3de0e6cda41mr7552780637.25.1790407265676; Sat, 26 Sep 2026
 00:21:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923205028.711077-1-kolyshkin@gmail.com> <20260925-zugnummer-intolerant-unwahr-2cddd52e435c@brauner>
In-Reply-To: <20260925-zugnummer-intolerant-unwahr-2cddd52e435c@brauner>
From: Kirill Kolyshkin <kolyshkin@gmail.com>
Date: Sat, 26 Sep 2026 00:20:54 -0700
X-Gm-Features: AclHuK8CjebxrGLaeQF03zgqQYXxG7Ana61oRaZrCBoCqp-gd9qKzgfSLqEq9J4
Message-ID: <CAGmPdryJ32KFtJiX3X+3X_9Fkesj=9GHjPN2qm3H_ctd4Z0bdg@mail.gmail.com>
Subject: Re: [RFC PATCH] mount: add OPEN_TREE_SKIP_MNTNS
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, 
	Jeff Layton <jlayton@kernel.org>, "Eric W . Biederman" <ebiederm@xmission.com>, 
	David Howells <dhowells@redhat.com>, Amir Goldstein <amir73il@gmail.com>, 
	Andrei Vagin <avagin@google.com>, Shuah Khan <shuah@kernel.org>, 
	Giuseppe Scrivano <giuseppe@scrivano.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	containers@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 6:45=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Wed, Sep 23, 2026 at 01:50:25PM -0700, Kir Kolyshkin wrote:
> > crun, a container runtime, recently started using OPEN_TREE_NAMESPACE t=
o
> > set up the container's mount namespace, and open_tree(OPEN_TREE_CLONE)
> > for the sources of its bind mounts.  This turns out not to work on host=
s
> > that have a mount namespace pinned anywhere below such a source: the
> > recursive clone picks the pinned namespace up, and move_mount(2) then
> > refuses to attach the tree with ELOOP from check_for_nsfs_mounts().
> > This was reported to crun in [1].
>
> Yeah, I think that makes sense. Please split this into two patches
> though: semantic changes separate from test changes. Maybe call it
> OPEN_TREE_DROP_MNTNS_MOUNTS instead?

Thanks! Done in v2:
https://lore.kernel.org/r/20260926-nsfs-prune-rfc-v2-0-53509260e4e7@gmail.c=
om
