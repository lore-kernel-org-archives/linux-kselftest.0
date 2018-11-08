From: jakub.kicinski@netronome.com (Jakub Kicinski)
Date: Thu, 8 Nov 2018 11:35:03 -0800
Subject: [PATCH v3 bpf-next 4/4] bpftool: support loading flow dissector
In-Reply-To: <d61e20cb-ccb1-1502-3119-8f71fb8d3570@netronome.com>
References: <20181108053957.205681-1-sdf@google.com>
 <20181108053957.205681-5-sdf@google.com>
 <8c35340e-3ed7-70cd-3123-7cd0fb8824a7@netronome.com>
 <20181108180153.tbssxcgkkq5xcdxc@mini-arch>
 <d61e20cb-ccb1-1502-3119-8f71fb8d3570@netronome.com>
Message-ID: <20181108113503.0f4ce2e7@cakuba.hsd1.ca.comcast.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181108193503.gn1pelyKOuhIVwrASnwqhclhuSZpYrfuxaLuiIY6f60@z>

On Thu, 8 Nov 2018 18:21:24 +0000, Quentin Monnet wrote:
> >>> @@ -79,8 +82,11 @@ DESCRIPTION
> >>>   		  contain a dot character ('.'), which is reserved for future
> >>>   		  extensions of *bpffs*.
> >>> -	**bpftool prog load** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
> >>> +	**bpftool prog { load | loadall }** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
> >>>   		  Load bpf program from binary *OBJ* and pin as *FILE*.
> >>> +		  **bpftool prog load** will pin only the first bpf program
> >>> +		  from the *OBJ*, **bpftool prog loadall** will pin all maps
> >>> +		  and programs from the *OBJ*.  
> >>
> >> This could be improved regarding maps: with "bpftool prog load" I think we
> >> also load and pin all maps, but your description implies this is only the
> >> case with "loadall"  
> > I don't think we pin any maps with `bpftool prog load`, we certainly load
> > them, but we don't pin any afaict. Can you point me to the code where we
> > pin the maps?
> >   
> 
> My bad. I read "pin" but thought "load". It does not pin them indeed,
> sorry about that.

Right, but I don't see much reason why prog loadall should pin maps.
The reason to pin program(s) is to hold some reference and to be able
to find them.  Since we have the programs pinned we should be able to
find their maps with relative ease.

$ bpftool prog show pinned /sys/fs/bpf/prog
7: cgroup_skb  tag 2a142ef67aaad174  gpl
	loaded_at 2018-11-08T11:02:25-0800  uid 0
	xlated 296B  jited 229B  memlock 4096B  map_ids 6,7

possibly:

$ bpftool -j prog show pinned /sys/fs/bpf/prog | jq '.map_ids[0]'
6

Moreover, I think program and map names may collide making ELFs
unloadable..
