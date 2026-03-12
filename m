Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF523EFD12
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 17:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773335924; cv=none; b=Inyl03iPBSqx519U8XBWbvCJ+a6SztsoGmgf0QZWrvIglN4LKloRomq3Un1ZNy+7JLr42BhvzcqIKW4+tweI0yl7tQtfDLHKxdQuve5YpL7+tFzxSZ1AhB2zf6/yE72x+Ab/QlMkE+fIQbX/7TXfK65OvPEnBDPi9f4s+J9WNOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773335924; c=relaxed/simple;
	bh=ndH024th091qZmX584oGTXtZizf4LqaUONy9B6SBLtU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=nUVlgAs4WwUdk5nAU2xwrh5Fffi/+hGGPMK0pqggVlrprFwaLDbLiJZKV8liwtwl4TANtyAtHk60gBZoSnbrs8lyANfXESlcc575iiKnGf7V5NvMPzdKld8uCnsCf25dsHvdzbAFKsOp7mmXaxXJjMEtPxCdIprvqGXFaHwaPOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxDOePfv; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxDOePfv"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-662abedbeb7so2087330a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 10:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773335919; x=1773940719; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n89BKkvKnK9oUy461M8tXOh1uJvswCD9P31wFhdVgjc=;
        b=BxDOePfv+/V2+zQHO0Ktsxmo3AcJ34HHIBTKRBVh1EJusYTqnBhu2KP0zszqJjBxLE
         7LrvypGM60L/UK61Di+xQ+oS1ciHtsHQSGzvof0oHYudlMHXSuExZJ4ueEVhjNv6VmUH
         BBOdsnUUeAXyT4zEVaVmAkW0/C6jLz3+N+tj9bNbAleecDHjWmFEzWPdwDTCWZvnaOcp
         4o2fcsUsprmUvYHUq1AmC/eWhC2UvsKl/wLCwJNBbMXHraGrYtr30NJMUmO8XVRldoZ0
         jAeg2kIe6IUfJb+MjdTrJIZ8TMpBlj3O1N78O3q5gY9aNEg7UCWiMxxzWZ42cxjZHEPi
         UU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773335919; x=1773940719;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n89BKkvKnK9oUy461M8tXOh1uJvswCD9P31wFhdVgjc=;
        b=scbQiqx11LMIQQoam3GT7DtZwZVGGdxr7hvNV/chpgszFh6buZ3ynN6uPjsYJWMOlH
         5Pjieisx6pFWvEJQrko/P56QSsjMLH3m/uHFq8A+Sc2nN4jVbs5ncS33ZHf06G+/WXHP
         fhWhpAOO0HHtsBM6JkE2tukfUYdU+lDtvLSvo7ligS659+dyBDwLfGGyQl8SzC4amqNh
         e3pCwgb6hvn8BwHeQbb3ssCN2sKilundEZJi3zB6R6ZcpACTtV5HqK6xI5Hqyb4VBRME
         LzgRpWhG2Op6mG6x7IykDt7nfWKSuMX5GiotfkOowYIQ4OK8KxA9/33Kr5zvRH1AKALT
         YlRA==
X-Forwarded-Encrypted: i=1; AJvYcCV8huDZY4HwXEuRY1k1ox8r/hYBDZCZOh3Lre/1EH+TdnKQEwRFJoJmJUKVD+vitiOoRmFKb97tqqyofllD/Lg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd5bMCjoeQK6hYhoXG5cU3Pi+CkosTD2eCx+4KykUYmZQXmR/F
	lhmBj9xggIb6ETDEEHWao8grcdFoOHAJxI8pEfVk8AeLXSNVfNjt1vs4WvN89w==
X-Gm-Gg: ATEYQzxcTAMTghGCdKePIwkLtW4iWMjkcFE48PQDYfiVZrHDZIqR2Y/J6tgBw239cXt
	LtMrItpAhd7bHlify70Z/KEQ+iunAbcqNxz00hcOOlXmPK0N3KzEBz35uYz2pY0KVCAwfMqnDBi
	mxaa+6p/v/ztJNSXUIuAvdOup/sYlnRokOIkLNLJXD/P7bcJ7sWF8SV9+o8w+eVwb/M7VsPsAJj
	JNI2eASgj4GLo3iwnkaM2rqzogeI6NiaAbx3C4JbsXOIPqh0v34WNvt/TvKq63A7Uiy5pqgVQ+V
	VjYBQG+5eg4hfbCRoTobaSrPwcJrl5mOfpW76IHsy9wfNfLiYpBs/t0ozGmhzt7sFacUqTgRVWc
	ALDCuaBV05scJUGdGjva04iBdi7//hFe8upnjvaZzppdzBZJLNzzXvn1JKGXxQVcGxyUOpLJNMN
	wyER3xHVj5l8cqZ3ylwyqAeAOAog==
X-Received: by 2002:a05:6402:1d4b:b0:660:f609:2eca with SMTP id 4fb4d7f45d1cf-663babff58dmr127651a12.18.1773335918689;
        Thu, 12 Mar 2026 10:18:38 -0700 (PDT)
Received: from imac ([88.97.103.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6635088ffb8sm637174a12.22.2026.03.12.10.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 10:18:38 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net,  netdev@vger.kernel.org,  edumazet@google.com,
  pabeni@redhat.com,  andrew+netdev@lunn.ch,  horms@kernel.org,
  shuah@kernel.org,  sdf@fomichev.me,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 0/5] tools: ynl: policy query support
In-Reply-To: <20260311113550.6b493008@kernel.org>
Date: Thu, 12 Mar 2026 17:17:29 +0000
Message-ID: <m28qbxnf12.fsf@gmail.com>
References: <20260310005337.3594225-1-kuba@kernel.org>
	<177319682153.3014711.5472638473199917370.git-patchwork-notify@kernel.org>
	<m2jyviob64.fsf@gmail.com> <20260311113550.6b493008@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> On Wed, 11 Mar 2026 11:30:59 +0000 Donald Hunter wrote:
>> > On Mon,  9 Mar 2026 17:53:32 -0700 you wrote:  
>> >> Improve the Netlink policy support in YNL. This series grew out of
>> >> improvements to policy checking, when writing selftests I realized
>> >> that instead of doing all the policy parsing in the test we're
>> >> better off making it part of YNL itself.
>> >> 
>> >> Patch 1 adds pad handling, apparently we never hit pad with commonly
>> >> used families. nlctrl policy dumps use pad more frequently.
>> >> Patch 2 is a trivial refactor.
>> >> Patch 3 pays off some technical debt in terms of documentation.
>> >> The YnlFamily class is growing in size and it's quite hard to
>> >> find its members. So document it a little bit.
>> >> Patch 4 is the main dish, the implementation of get_policy(op)
>> >> in YnlFamily.
>> >> Patch 5 plugs the new functionality into the CLI.  
>> 
>> I was mid review
>
> Sorry about that! :( I didn't see any reply to the one liner for a few
> days I thought you may be AFK :)
>
>> looking at a couple of issues:
>> 
>> - It would be good to fail more gracefully for netlink-raw families
>
> This one I saw, but I figured the message that gets printed is...
> reasonable. For low level functionality like policies we should 
> assume user is relatively advanced? The policies are spotty
> even in genetlink, a lot of families don't link them up properly :(
> So explaining all of this is a bit of a rabbit hole.

That's fair. I had it in mind to work on avoiding emitting stack traces
for "normal usage". If I get to that then I can see about handling this
case as well.

>> - I get "RecursionError: maximum recursion depth exceeded" for nl80211
>
> :o Missed this one completely! My feeling is that we should lean into
> the NlPolicy class more, and avoid rendering the full structure upfront.
> WDYT about the following?

I agree with the approach. The code below looks reasonable, though I
haven't been thorough - I'll wait for the patch.

> diff --git a/tools/net/ynl/pyynl/cli.py b/tools/net/ynl/pyynl/cli.py
> index fc9e84754e4b..ff0cfbdc82e4 100755
> --- a/tools/net/ynl/pyynl/cli.py
> +++ b/tools/net/ynl/pyynl/cli.py
> @@ -16,7 +16,8 @@ import textwrap
>  
>  # pylint: disable=no-name-in-module,wrong-import-position
>  sys.path.append(pathlib.Path(__file__).resolve().parent.as_posix())
> -from lib import YnlFamily, Netlink, NlError, SpecFamily, SpecException, YnlException
> +from lib import SpecFamily, SpecException
> +from lib import YnlFamily, Netlink, NlError, NlPolicy, YnlException
>  
>  SYS_SCHEMA_DIR='/usr/share/ynl'
>  RELATIVE_SCHEMA_DIR='../../../../Documentation/netlink'
> @@ -79,6 +80,8 @@ RELATIVE_SCHEMA_DIR='../../../../Documentation/netlink'
>              return bytes.hex(o)
>          if isinstance(o, set):
>              return sorted(o)
> +        if isinstance(o, NlPolicy):
> +            return o.to_dict()
>          return json.JSONEncoder.default(self, o)
>  
>  
> @@ -313,11 +316,11 @@ RELATIVE_SCHEMA_DIR='../../../../Documentation/netlink'
>      if args.policy:
>          if args.do:
>              pol = ynl.get_policy(args.do, 'do')
> -            output(pol.attrs if pol else None)
> +            output(pol if pol else None)
>              args.do = None
>          if args.dump:
>              pol = ynl.get_policy(args.dump, 'dump')
> -            output(pol.attrs if pol else None)
> +            output(pol if pol else None)
>              args.dump = None
>  
>      if args.ntf:
> diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
> index 0eedeee465d8..4411f1902ae4 100644
> --- a/tools/net/ynl/pyynl/lib/ynl.py
> +++ b/tools/net/ynl/pyynl/lib/ynl.py
> @@ -143,32 +143,113 @@ from .nlspec import SpecFamily
>      pass
>  
>  
> -# pylint: disable=too-few-public-methods
>  class NlPolicy:
>      """Kernel policy for one mode (do or dump) of one operation.
>  
> -    Returned by YnlFamily.get_policy(). Contains a dict of attributes
> -    the kernel accepts, with their validation constraints.
> +    Returned by YnlFamily.get_policy(). Attributes of the policy
> +    are accessible as attributes of the object. Nested policies
> +    can be accessed indexing the object like a dictionary::
>  
> -    Attributes:
> -        attrs: dict mapping attribute names to policy dicts, e.g.
> -        page-pool-stats-get do policy::
> +        pol = ynl.get_policy('page-pool-stats-get', 'do')
> +        pol['info'].type            # 'nested'
> +        pol['info']['id'].type      # 'uint'
> +        pol['info']['id'].min_value # 1
>  
> -            {
> -                'info': {'type': 'nested', 'policy': {
> -                    'id':      {'type': 'uint', 'min-value': 1,
> -                                'max-value': 4294967295},
> -                    'ifindex': {'type': 'u32', 'min-value': 1,
> -                                'max-value': 2147483647},
> -                }},
> -            }
> +    Each policy entry always has a 'type' attribute (e.g. u32, string,
> +    nested). Optional attributes depending on the 'type': min-value,
> +    max-value, min-length, max-length, mask.
>  
> -        Each policy dict always contains 'type' (e.g. u32, string,
> -        nested). Optional keys: min-value, max-value, min-length,
> -        max-length, mask, policy.
> +    Policies can form infinite nesting loops. These loops are trimmed
> +    when policy is converted to a dict with pol.to_dict().
>      """
> -    def __init__(self, attrs):
> -        self.attrs = attrs
> +    def __init__(self, ynl, policy_idx, policy_table, attr_set, props=None):
> +        self._policy_idx = policy_idx
> +        self._policy_table = policy_table
> +        self._ynl = ynl
> +        self._props = props or {}
> +        self._entries = {}
> +        if policy_idx is not None and policy_idx in policy_table:
> +            for attr_id, decoded in policy_table[policy_idx].items():
> +                if attr_set and attr_id in attr_set.attrs_by_val:
> +                    spec = attr_set.attrs_by_val[attr_id]
> +                    name = spec['name']
> +                else:
> +                    spec = None
> +                    name = f'attr-{attr_id}'
> +                self._entries[name] = (spec, decoded)
> +
> +    def __getitem__(self, name):
> +        """Descend into a nested policy by attribute name."""
> +        spec, decoded = self._entries[name]
> +        props = dict(decoded)
> +        child_idx = None
> +        child_set = None
> +        if 'policy-idx' in props:
> +            child_idx = props.pop('policy-idx')
> +            if spec and 'nested-attributes' in spec.yaml:
> +                child_set = self._ynl.attr_sets[spec.yaml['nested-attributes']]
> +        return NlPolicy(self._ynl, child_idx, self._policy_table,
> +                        child_set, props)
> +
> +    def __getattr__(self, name):
> +        """Access this policy entry's own properties (type, min-value, etc.).
> +
> +        Underscores in the name are converted to dashes, so that
> +        pol.min_value looks up "min-value".
> +        """
> +        key = name.replace('_', '-')
> +        try:
> +            # Hack for level-0 which we still want to have .type but we don't
> +            # want type to pointlessly show up in the dict / JSON form.
> +            if not self._props and name == "type":
> +                return "nested"
> +            return self._props[key]
> +        except KeyError:
> +            raise AttributeError(name)
> +
> +    def get(self, name, default=None):
> +        """Look up a child policy entry by attribute name, with a default."""
> +        try:
> +            return self[name]
> +        except KeyError:
> +            return default
> +
> +    def __contains__(self, name):
> +        return name in self._entries
> +
> +    def __len__(self):
> +        return len(self._entries)
> +
> +    def __iter__(self):
> +        return iter(self._entries)
> +
> +    def keys(self):
> +        """Return attribute names accepted by this policy."""
> +        return self._entries.keys()
> +
> +    def to_dict(self, seen=None):
> +        """Convert to a plain dict, suitable for JSON serialization.
> +
> +        Nested NlPolicy objects are expanded recursively. Cyclic
> +        references are trimmed (resolved to just {"type": "nested"}).
> +        """
> +        if seen is None:
> +            seen = set()
> +        result = dict(self._props)
> +        if self._policy_idx is not None:
> +            if self._policy_idx not in seen:
> +                seen = seen | {self._policy_idx}
> +                children = {}
> +                for name in self:
> +                    children[name] = self[name].to_dict(seen)
> +                if self._props:
> +                    result['policy'] = children
> +                else:
> +                    result = children
> +        return result
> +
> +    def __repr__(self):
> +        return repr(self.to_dict())
>  
>  
>  class NlAttr:
> @@ -1308,28 +1389,6 @@ from .nlspec import SpecFamily
>      def do_multi(self, ops):
>          return self._ops(ops)
>  
> -    def _resolve_policy(self, policy_idx, policy_table, attr_set):
> -        attrs = {}
> -        if policy_idx not in policy_table:
> -            return attrs
> -        for attr_id, decoded in policy_table[policy_idx].items():
> -            if attr_set and attr_id in attr_set.attrs_by_val:
> -                spec = attr_set.attrs_by_val[attr_id]
> -                name = spec['name']
> -            else:
> -                spec = None
> -                name = f'attr-{attr_id}'
> -            if 'policy-idx' in decoded:
> -                sub_set = None
> -                if spec and 'nested-attributes' in spec.yaml:
> -                    sub_set = self.attr_sets[spec.yaml['nested-attributes']]
> -                nested = self._resolve_policy(decoded['policy-idx'],
> -                                              policy_table, sub_set)
> -                del decoded['policy-idx']
> -                decoded['policy'] = nested
> -            attrs[name] = decoded
> -        return attrs
> -
>      def get_policy(self, op_name, mode):
>          """Query running kernel for the Netlink policy of an operation.
>  
> @@ -1341,8 +1400,8 @@ from .nlspec import SpecFamily
>              mode: 'do' or 'dump'
>  
>          Returns:
> -            NlPolicy with an attrs dict mapping attribute names to
> -            their policy properties (type, min/max, nested, etc.),
> +            NlPolicy acting as a read-only dict mapping attribute names
> +            to their policy properties (type, min/max, nested, etc.),
>              or None if the operation has no policy for the given mode.
>              Empty policy usually implies that the operation rejects
>              all attributes.
> @@ -1353,5 +1412,4 @@ from .nlspec import SpecFamily
>          if mode not in op_policy:
>              return None
>          policy_idx = op_policy[mode]
> -        attrs = self._resolve_policy(policy_idx, policy_table, op.attr_set)
> -        return NlPolicy(attrs)
> +        return NlPolicy(self, policy_idx, policy_table, op.attr_set)
