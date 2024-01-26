function cd()
{
   if [ -f .exit.sh ]; then
      source .exit.sh;
   fi

   if [ -z $* ]; then
      builtin cd ~
   else
      builtin cd "$*"
   fi

   if [ -f .enter.sh ]; then
      source .enter.sh;
   fi
}
