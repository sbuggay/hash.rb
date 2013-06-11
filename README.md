hash.rb
=======

compare hashes and digests of strings and files extremely easily

compare md5 hashes of strings
<pre>
ruby hash.rb -t md5 string1 string2 string3
</pre>

treat arguements as files with the -f flag
<pre>
ruby hash.rb -f -t md5 file1 file2 file3
</pre>

hash.rb defaults to md5
<pre>
ruby hash.rb -f file1 file2
</pre>

compare hashes
<pre>
ruby hash.rb -c string1,string2
</pre>

supports
<pre>
md5
sha1
sha2
</pre>
